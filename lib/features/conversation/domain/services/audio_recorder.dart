abstract class AudioRecorder {
  Future<void> requestPermission();
  Future<void> startRecording();
  Future<String> stopRecording(); // returns audio file path
  Stream<Duration> get elapsedTime;
  static const maxDuration = Duration(seconds: 120);
}
