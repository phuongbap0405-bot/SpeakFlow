import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart' as rec;

import '../../domain/services/audio_recorder.dart';
import '../../../../core/error/exceptions.dart';

/// Implementation of [AudioRecorder] using the `record` package.
///
/// Records microphone audio to a temporary M4A file. Exposes elapsed
/// recording time as a [Stream<Duration>] updated every second and
/// enforces a 120-second maximum duration with automatic stop.
@Injectable(as: AudioRecorder)
class AudioRecorderImpl implements AudioRecorder {
  final rec.AudioRecorder _recorder = rec.AudioRecorder();

  final StreamController<Duration> _elapsedController =
      StreamController<Duration>.broadcast();

  Timer? _elapsedTimer;
  Timer? _maxDurationTimer;
  int _elapsedSeconds = 0;
  String? _currentFilePath;

  @override
  Stream<Duration> get elapsedTime => _elapsedController.stream;

  @override
  Future<void> requestPermission() async {
    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      throw const AudioRecordingException(
        'Microphone permission denied. Please grant microphone access in device settings.',
      );
    }
  }

  @override
  Future<void> startRecording() async {
    final tempDir = await getTemporaryDirectory();
    _currentFilePath = '${tempDir.path}/speakflow_recording.m4a';

    await _recorder.start(
      const rec.RecordConfig(encoder: rec.AudioEncoder.aacLc),
      path: _currentFilePath!,
    );

    _elapsedSeconds = 0;
    _elapsedController.add(Duration.zero);

    // Emit elapsed time every second.
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedSeconds++;
      _elapsedController.add(Duration(seconds: _elapsedSeconds));
    });

    // Auto-stop after 120 seconds.
    _maxDurationTimer = Timer(AudioRecorder.maxDuration, () async {
      await stopRecording();
    });
  }

  @override
  Future<String> stopRecording() async {
    _elapsedTimer?.cancel();
    _elapsedTimer = null;

    _maxDurationTimer?.cancel();
    _maxDurationTimer = null;

    final path = await _recorder.stop();

    final filePath = path ?? _currentFilePath;
    _currentFilePath = null;

    if (filePath == null) {
      throw const AudioRecordingException(
        'Recording failed: no audio file was produced.',
      );
    }

    return filePath;
  }
}
