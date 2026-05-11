import 'package:flutter/foundation.dart';

import '../../../conversation/domain/entities/turn.dart';

/// Sealed base class for all [ConversationBloc] states.
@immutable
sealed class ConversationState {
  const ConversationState();
}

/// Initial state — no recording or processing is active.
class ConversationIdle extends ConversationState {
  const ConversationIdle();
}

/// The user is currently recording audio.
class Recording extends ConversationState {
  final Duration elapsed;
  const Recording(this.elapsed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recording &&
          runtimeType == other.runtimeType &&
          elapsed == other.elapsed;

  @override
  int get hashCode => elapsed.hashCode;
}

/// Audio has been captured and STT transcription is in progress.
class Transcribing extends ConversationState {
  const Transcribing();
}

/// Transcription succeeded and the LLM is generating a response.
class GeneratingResponse extends ConversationState {
  const GeneratingResponse();
}

/// The AI Tutor response is being played back via TTS.
class PlayingTts extends ConversationState {
  final String turnId;
  const PlayingTts(this.turnId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayingTts &&
          runtimeType == other.runtimeType &&
          turnId == other.turnId;

  @override
  int get hashCode => turnId.hashCode;
}

/// TTS playback has completed (or was skipped on error) — the user may record
/// the next turn. [turns] is the full list of completed turns so far.
class AwaitingNextTurn extends ConversationState {
  final List<Turn> turns;
  const AwaitingNextTurn(this.turns);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AwaitingNextTurn &&
          runtimeType == other.runtimeType &&
          _listEquals(turns, other.turns);

  @override
  int get hashCode => Object.hashAll(turns);

  static bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// The Corrections Panel is open for [turn].
class CorrectionsOpen extends ConversationState {
  final Turn turn;
  const CorrectionsOpen(this.turn);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorrectionsOpen &&
          runtimeType == other.runtimeType &&
          turn == other.turn;

  @override
  int get hashCode => turn.hashCode;
}

/// An error occurred during STT, LLM, or TTS processing.
///
/// [retryAction] is a callback that re-dispatches the appropriate event so the
/// user can retry the failed operation. Because [VoidCallback] is not
/// compatible with freezed, this class is a plain Dart class rather than a
/// freezed variant.
class ConversationError extends ConversationState {
  final String message;

  /// Callback that retries the failed operation when invoked.
  final VoidCallback retryAction;

  const ConversationError({
    required this.message,
    required this.retryAction,
  });
}

/// The session has been persisted and is complete.
class SessionComplete extends ConversationState {
  const SessionComplete();
}
