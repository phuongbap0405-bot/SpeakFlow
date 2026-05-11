import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.sttError(String message) = SttFailure;
  const factory Failure.llmError(String message) = LlmFailure;
  const factory Failure.ttsError(String message) = TtsFailure;
  const factory Failure.audioRecordingError(String message) = AudioRecordingFailure;
  const factory Failure.storageError(String message) = StorageFailure;
  const factory Failure.permissionDenied() = PermissionDeniedFailure;
  const factory Failure.networkError(String message) = NetworkFailure;
}
