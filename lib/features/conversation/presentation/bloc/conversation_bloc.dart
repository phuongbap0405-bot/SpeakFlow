import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../features/history/domain/entities/session.dart';
import '../../domain/entities/turn.dart';
import '../../domain/services/audio_recorder.dart';
import '../../domain/use_cases/end_session_use_case.dart';
import '../../domain/use_cases/generate_turn_response_use_case.dart';
import '../../domain/use_cases/synthesize_speech_use_case.dart';
import '../../domain/use_cases/transcribe_audio_use_case.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

/// Manages the full conversation turn flow:
///
///   [RecordingStarted] → [RecordingStopped] → [TranscriptionRequested]
///   → [ResponseRequested] → [TtsCompleted] / [TtsErrorOccurred]
///
/// Also handles [CorrectionsOpened], [CorrectionsDismissed], and
/// [SessionEnded].
///
/// The [Session] is passed at construction time (set at navigation from the
/// topic selection screen). The bloc accumulates [Turn]s in [_turns] and
/// writes them back to the session when [SessionEnded] is handled.
class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final TranscribeAudioUseCase _transcribeAudio;
  final GenerateTurnResponseUseCase _generateTurnResponse;
  final SynthesizeSpeechUseCase _synthesizeSpeech;
  final EndSessionUseCase _endSession;
  final AudioRecorder _audioRecorder;

  /// The session created by [StartSessionUseCase] and passed at navigation.
  Session _session;

  /// Accumulated turns for the current session.
  final List<Turn> _turns = [];

  /// Subscription to the [AudioRecorder.elapsedTime] stream.
  StreamSubscription<Duration>? _elapsedTimeSubscription;

  static const _uuid = Uuid();

  ConversationBloc({
    required TranscribeAudioUseCase transcribeAudio,
    required GenerateTurnResponseUseCase generateTurnResponse,
    required SynthesizeSpeechUseCase synthesizeSpeech,
    required EndSessionUseCase endSession,
    required AudioRecorder audioRecorder,
    required Session session,
  })  : _transcribeAudio = transcribeAudio,
        _generateTurnResponse = generateTurnResponse,
        _synthesizeSpeech = synthesizeSpeech,
        _endSession = endSession,
        _audioRecorder = audioRecorder,
        _session = session,
        super(const ConversationIdle()) {
    on<RecordingStarted>(_onRecordingStarted);
    on<RecordingStopped>(_onRecordingStopped);
    on<TranscriptionRequested>(_onTranscriptionRequested);
    on<ResponseRequested>(_onResponseRequested);
    on<TtsCompleted>(_onTtsCompleted);
    on<TtsErrorOccurred>(_onTtsErrorOccurred);
    on<CorrectionsOpened>(_onCorrectionsOpened);
    on<CorrectionsDismissed>(_onCorrectionsDismissed);
    on<SessionEnded>(_onSessionEnded);
    on<RecordingTick>(_onRecordingTick);
  }

  // ---------------------------------------------------------------------------
  // Event handlers
  // ---------------------------------------------------------------------------

  /// Forwards an elapsed-time tick from the [AudioRecorder] stream into a
  /// [Recording] state update.
  Future<void> _onRecordingTick(
    RecordingTick event,
    Emitter<ConversationState> emit,
  ) async {
    emit(Recording(event.elapsed));
  }

  /// Starts microphone capture and emits [Recording] on each elapsed-time tick.
  ///
  /// Before starting, calls [AudioRecorder.requestPermission]. If permission
  /// is denied (throws [AudioRecordingException]), emits [ConversationError]
  /// with an explanatory message and a retry action that re-adds
  /// [RecordingStarted] so the user can try again after granting access.
  Future<void> _onRecordingStarted(
    RecordingStarted event,
    Emitter<ConversationState> emit,
  ) async {
    try {
      await _audioRecorder.requestPermission();
    } on AudioRecordingException {
      emit(ConversationError(
        message:
            'Microphone permission denied. Please grant microphone access in device settings.',
        retryAction: () => add(const RecordingStarted()),
      ));
      return;
    }

    await _audioRecorder.startRecording();

    await _elapsedTimeSubscription?.cancel();
    _elapsedTimeSubscription = _audioRecorder.elapsedTime.listen((elapsed) {
      if (!isClosed) add(RecordingTick(elapsed));
    });

    emit(const Recording(Duration.zero));
  }

  /// Stops microphone capture, emits [Transcribing], then dispatches
  /// [TranscriptionRequested] with the produced audio file path.
  Future<void> _onRecordingStopped(
    RecordingStopped event,
    Emitter<ConversationState> emit,
  ) async {
    await _elapsedTimeSubscription?.cancel();
    _elapsedTimeSubscription = null;

    final audioPath = await _audioRecorder.stopRecording();
    emit(const Transcribing());
    add(TranscriptionRequested(audioPath));
  }

  /// Calls [TranscribeAudioUseCase]. On success emits [GeneratingResponse] and
  /// dispatches [ResponseRequested]. On failure emits [ConversationError] with
  /// a retry callback.
  Future<void> _onTranscriptionRequested(
    TranscriptionRequested event,
    Emitter<ConversationState> emit,
  ) async {
    final result =
        await _transcribeAudio(audioFilePath: event.audioPath);

    result.fold(
      (failure) {
        final message = _failureMessage(failure);
        emit(ConversationError(
          message: message,
          retryAction: () => add(TranscriptionRequested(event.audioPath)),
        ));
      },
      (transcription) {
        emit(const GeneratingResponse());
        add(ResponseRequested(transcription));
      },
    );
  }

  /// Calls [GenerateTurnResponseUseCase] with the full turn history. On success
  /// creates a [Turn], adds it to [_turns], emits [PlayingTts], calls
  /// [SynthesizeSpeechUseCase], and dispatches [TtsCompleted] or
  /// [TtsErrorOccurred]. On LLM failure emits [ConversationError] with retry.
  Future<void> _onResponseRequested(
    ResponseRequested event,
    Emitter<ConversationState> emit,
  ) async {
    final llmResult = await _generateTurnResponse(
      topic: _session.topic,
      userMessage: event.transcription,
      conversationHistory: List.unmodifiable(_turns),
    );

    await llmResult.fold(
      (failure) async {
        final message = _failureMessage(failure);
        emit(ConversationError(
          message: message,
          retryAction: () => add(ResponseRequested(event.transcription)),
        ));
      },
      (llmResponse) async {
        final turn = Turn(
          id: _uuid.v4(),
          transcription: event.transcription,
          aiResponse: llmResponse.responseText,
          grammarCorrections: llmResponse.grammarCorrections,
          recordingDurationMs: 0, // duration tracked by AudioRecorder; set to 0 here
          timestamp: DateTime.now(),
        );
        _turns.add(turn);

        emit(PlayingTts(turn.id));

        final ttsResult =
            await _synthesizeSpeech(text: llmResponse.responseText);

        ttsResult.fold(
          (_) => add(const TtsErrorOccurred()),
          (_) => add(const TtsCompleted()),
        );
      },
    );
  }

  /// TTS completed successfully — allow the user to record the next turn.
  Future<void> _onTtsCompleted(
    TtsCompleted event,
    Emitter<ConversationState> emit,
  ) async {
    emit(AwaitingNextTurn(List.unmodifiable(_turns)));
  }

  /// TTS failed — skip playback but still enable the record button (Req 5.5).
  Future<void> _onTtsErrorOccurred(
    TtsErrorOccurred event,
    Emitter<ConversationState> emit,
  ) async {
    emit(AwaitingNextTurn(List.unmodifiable(_turns)));
  }

  /// Finds the turn by [turnId] and emits [CorrectionsOpen] without mutating
  /// [_turns] (Req 6.6).
  Future<void> _onCorrectionsOpened(
    CorrectionsOpened event,
    Emitter<ConversationState> emit,
  ) async {
    final turn = _turns.where((t) => t.id == event.turnId).firstOrNull;
    if (turn != null) {
      emit(CorrectionsOpen(turn));
    }
  }

  /// Dismisses the Corrections Panel and returns to [AwaitingNextTurn] with
  /// the unchanged turn list (Req 6.6).
  Future<void> _onCorrectionsDismissed(
    CorrectionsDismissed event,
    Emitter<ConversationState> emit,
  ) async {
    emit(AwaitingNextTurn(List.unmodifiable(_turns)));
  }

  /// Persists the completed session via [EndSessionUseCase] and emits
  /// [SessionComplete].
  Future<void> _onSessionEnded(
    SessionEnded event,
    Emitter<ConversationState> emit,
  ) async {
    final completedSession = _session.copyWith(
      endTime: DateTime.now(),
      turns: List.unmodifiable(_turns),
    );
    _session = completedSession;

    await _endSession(session: completedSession);
    emit(const SessionComplete());
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  String _failureMessage(Failure failure) {
    // Pattern-match on the Failure sealed class variants.
    // The switch expression will be exhaustive once build_runner generates
    // the freezed code; until then the IDE shows errors only for missing
    // generated files, not for logic issues.
    return switch (failure) {
      SttFailure(:final message) => 'Speech recognition failed: $message',
      LlmFailure(:final message) => 'AI response failed: $message',
      TtsFailure(:final message) => 'Text-to-speech failed: $message',
      AudioRecordingFailure(:final message) => 'Recording failed: $message',
      StorageFailure(:final message) => 'Storage failed: $message',
      PermissionDeniedFailure() => 'Microphone permission denied.',
      NetworkFailure(:final message) => 'Network error: $message',
    };
  }

  @override
  Future<void> close() async {
    await _elapsedTimeSubscription?.cancel();
    return super.close();
  }
}

