import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_event.freezed.dart';

/// Sealed event hierarchy for [ConversationBloc], generated with freezed.
///
/// [VoidCallback] is not used in events, so freezed is safe here.
@freezed
sealed class ConversationEvent with _$ConversationEvent {
  /// User pressed the record button — begin microphone capture.
  const factory ConversationEvent.recordingStarted() = RecordingStarted;

  /// User pressed the stop button — end microphone capture.
  const factory ConversationEvent.recordingStopped() = RecordingStopped;

  /// Dispatched internally after recording stops with the produced audio file path.
  const factory ConversationEvent.transcriptionRequested(String audioPath) =
      TranscriptionRequested;

  /// Dispatched internally after transcription succeeds with the transcribed text.
  const factory ConversationEvent.responseRequested(String transcription) =
      ResponseRequested;

  /// Dispatched internally when TTS playback completes successfully.
  const factory ConversationEvent.ttsCompleted() = TtsCompleted;

  /// Dispatched internally when TTS playback fails.
  const factory ConversationEvent.ttsErrorOccurred() = TtsErrorOccurred;

  /// User tapped the Inline Indicator on a turn bubble to open the Corrections Panel.
  const factory ConversationEvent.correctionsOpened(String turnId) =
      CorrectionsOpened;

  /// User dismissed the Corrections Panel.
  const factory ConversationEvent.correctionsDismissed() = CorrectionsDismissed;

  /// User ended the session (e.g. pressed "End Session" button).
  const factory ConversationEvent.sessionEnded() = SessionEnded;

  /// Internal event forwarded from the [AudioRecorder.elapsedTime] stream.
  /// Not part of the public API — used only within [ConversationBloc].
  const factory ConversationEvent.recordingTick(Duration elapsed) =
      RecordingTick;
}
