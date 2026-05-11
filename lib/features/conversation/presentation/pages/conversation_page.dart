import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/history/domain/entities/session.dart';
import '../../domain/services/audio_recorder.dart';
import '../../domain/services/tts_service.dart';
import '../../domain/use_cases/end_session_use_case.dart';
import '../../domain/use_cases/generate_turn_response_use_case.dart';
import '../../domain/use_cases/synthesize_speech_use_case.dart';
import '../../domain/use_cases/transcribe_audio_use_case.dart';
import '../bloc/conversation_bloc.dart';
import '../bloc/conversation_event.dart';
import '../bloc/conversation_state.dart';
import '../widgets/conversation_bubble.dart';
import '../widgets/corrections_panel.dart';
import '../widgets/record_button.dart';
import '../widgets/recording_timer.dart';

/// The main conversation screen.
///
/// Takes a [Session] created by [StartSessionUseCase] and passed from
/// [TopicPage]. Creates [ConversationBloc] manually because the bloc requires
/// the session as a constructor parameter (not injectable via GetIt).
class ConversationPage extends StatelessWidget {
  final Session session;

  const ConversationPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConversationBloc>(
      create: (context) => ConversationBloc(
        transcribeAudio: GetIt.instance<TranscribeAudioUseCase>(),
        generateTurnResponse: GetIt.instance<GenerateTurnResponseUseCase>(),
        synthesizeSpeech: GetIt.instance<SynthesizeSpeechUseCase>(),
        endSession: GetIt.instance<EndSessionUseCase>(),
        audioRecorder: GetIt.instance<AudioRecorder>(),
        session: session,
      ),
      child: _ConversationView(session: session),
    );
  }
}

class _ConversationView extends StatelessWidget {
  final Session session;

  const _ConversationView({required this.session});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConversationBloc, ConversationState>(
      listener: (context, state) {
        if (state is ConversationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: state.retryAction,
              ),
            ),
          );
        } else if (state is SessionComplete) {
          // Pop back to the previous screen (TopicPage / home).
          Navigator.of(context).pop();
        } else if (state is CorrectionsOpen) {
          // Show the corrections panel as a bottom sheet.
          CorrectionsPanel.show(
            context,
            state.turn.grammarCorrections,
            () => context
                .read<ConversationBloc>()
                .add(const ConversationEvent.correctionsDismissed()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(session.topic),
          actions: [
            TextButton(
              onPressed: () => context
                  .read<ConversationBloc>()
                  .add(const ConversationEvent.sessionEnded()),
              child: const Text('End Session'),
            ),
          ],
        ),
        body: const _ConversationBody(),
        floatingActionButton: const _RecordFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Body
// ---------------------------------------------------------------------------

/// Stateful so we can retain the last known turns list across state changes
/// (e.g. when [CorrectionsOpen] is emitted, which only carries a single turn).
class _ConversationBody extends StatefulWidget {
  const _ConversationBody();

  @override
  State<_ConversationBody> createState() => _ConversationBodyState();
}

class _ConversationBodyState extends State<_ConversationBody> {
  List _lastKnownTurns = const [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (context, state) {
        // Update the cached turns whenever we have a full list.
        if (state is AwaitingNextTurn) {
          _lastKnownTurns = state.turns;
        }

        final playingTurnId = state is PlayingTts ? state.turnId : null;

        return Column(
          children: [
            Expanded(
              child: _lastKnownTurns.isEmpty
                  ? const _EmptyConversation()
                  : _TurnList(
                      turns: _lastKnownTurns,
                      playingTurnId: playingTurnId,
                    ),
            ),
            _StatusBar(state: state),
          ],
        );
      },
    );
  }
}

class _TurnList extends StatefulWidget {
  final List turns;
  final String? playingTurnId;

  const _TurnList({
    required this.turns,
    required this.playingTurnId,
  });

  @override
  State<_TurnList> createState() => _TurnListState();
}

class _TurnListState extends State<_TurnList> {
  final _scrollController = ScrollController();

  @override
  void didUpdateWidget(_TurnList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.turns.length != oldWidget.turns.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      itemCount: widget.turns.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final turn = widget.turns[index];
        final isPlayingTts = turn.id == widget.playingTurnId;
        final showInlineIndicator = turn.grammarCorrections.isNotEmpty;

        return ConversationBubble(
          turn: turn,
          isPlayingTts: isPlayingTts,
          showInlineIndicator: showInlineIndicator,
          onInlineIndicatorTap: () => context
              .read<ConversationBloc>()
              .add(ConversationEvent.correctionsOpened(turn.id)),
        );
      },
    );
  }
}

class _EmptyConversation extends StatelessWidget {
  const _EmptyConversation();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Tap the mic to start speaking',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Status bar (loading indicators + recording timer)
// ---------------------------------------------------------------------------

class _StatusBar extends StatelessWidget {
  final ConversationState state;

  const _StatusBar({required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      Recording(:final elapsed) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: RecordingTimer(elapsed: elapsed),
        ),
      Transcribing() => const _LoadingLabel(label: 'Transcribing…'),
      GeneratingResponse() =>
        const _LoadingLabel(label: 'Generating response…'),
      _ => const SizedBox.shrink(),
    };
  }
}

class _LoadingLabel extends StatelessWidget {
  final String label;

  const _LoadingLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 8),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// FAB area — record button + replay button
// ---------------------------------------------------------------------------

class _RecordFab extends StatelessWidget {
  const _RecordFab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (context, state) {
        final isRecording = state is Recording;

        // Record button is enabled only when idle or awaiting the next turn.
        final isEnabled = state is ConversationIdle ||
            state is AwaitingNextTurn ||
            state is Recording;

        // Show replay button only when TTS has completed and there are turns.
        final showReplay = state is AwaitingNextTurn &&
            state.turns.isNotEmpty;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showReplay)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: FloatingActionButton.small(
                  heroTag: 'replay_fab',
                  onPressed: () =>
                      GetIt.instance<TtsService>().replayLast(),
                  tooltip: 'Replay last response',
                  child: const Icon(Icons.replay_rounded),
                ),
              ),
            RecordButton(
              isEnabled: isEnabled,
              isRecording: isRecording,
              onPressed: () {
                if (isRecording) {
                  context
                      .read<ConversationBloc>()
                      .add(const ConversationEvent.recordingStopped());
                } else {
                  context
                      .read<ConversationBloc>()
                      .add(const ConversationEvent.recordingStarted());
                }
              },
            ),
          ],
        );
      },
    );
  }
}
