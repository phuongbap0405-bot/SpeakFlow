/// Thrown when the STT (Speech-to-Text) service fails.
class SttException implements Exception {
  final String message;
  const SttException(this.message);

  @override
  String toString() => 'SttException: $message';
}

/// Thrown when the LLM (Large Language Model) service fails.
class LlmException implements Exception {
  final String message;
  const LlmException(this.message);

  @override
  String toString() => 'LlmException: $message';
}

/// Thrown when the TTS (Text-to-Speech) service fails.
class TtsException implements Exception {
  final String message;
  const TtsException(this.message);

  @override
  String toString() => 'TtsException: $message';
}

/// Thrown when audio recording fails.
class AudioRecordingException implements Exception {
  final String message;
  const AudioRecordingException(this.message);

  @override
  String toString() => 'AudioRecordingException: $message';
}

/// Thrown when a local storage operation fails.
class StorageException implements Exception {
  final String message;
  const StorageException(this.message);

  @override
  String toString() => 'StorageException: $message';
}

/// Thrown when a network request fails.
class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}
