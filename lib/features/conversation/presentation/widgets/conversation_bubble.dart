import 'package:flutter/material.dart';

import '../../domain/entities/turn.dart';
import 'inline_indicator.dart';
import 'playback_indicator.dart';

/// Renders a single conversation turn as a chat bubble.
///
/// - User bubble: left-aligned, shows [turn.transcription], and an
///   [InlineIndicator] when [showInlineIndicator] is true.
/// - AI bubble: right-aligned, shows [turn.aiResponse], and a
///   [PlaybackIndicator] when [isPlayingTts] is true.
class ConversationBubble extends StatelessWidget {
  final Turn turn;
  final bool isPlayingTts;
  final bool showInlineIndicator;
  final VoidCallback? onInlineIndicatorTap;

  const ConversationBubble({
    super.key,
    required this.turn,
    required this.isPlayingTts,
    required this.showInlineIndicator,
    this.onInlineIndicatorTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _UserBubble(
          turn: turn,
          showInlineIndicator: showInlineIndicator,
          onInlineIndicatorTap: onInlineIndicatorTap,
        ),
        const SizedBox(height: 8),
        _AiBubble(
          turn: turn,
          isPlayingTts: isPlayingTts,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// User bubble
// ---------------------------------------------------------------------------

class _UserBubble extends StatelessWidget {
  final Turn turn;
  final bool showInlineIndicator;
  final VoidCallback? onInlineIndicatorTap;

  const _UserBubble({
    required this.turn,
    required this.showInlineIndicator,
    this.onInlineIndicatorTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      turn.transcription,
                      style: TextStyle(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  if (showInlineIndicator) ...[
                    const SizedBox(width: 6),
                    InlineIndicator(
                      onTap: onInlineIndicatorTap ?? () {},
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// AI bubble
// ---------------------------------------------------------------------------

class _AiBubble extends StatelessWidget {
  final Turn turn;
  final bool isPlayingTts;

  const _AiBubble({required this.turn, required this.isPlayingTts});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isPlayingTts)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PlaybackIndicator(),
                      const SizedBox(width: 4),
                      Text(
                        'Playing…',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSecondaryContainer
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                turn.aiResponse,
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
