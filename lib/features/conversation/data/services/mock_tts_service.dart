import 'package:injectable/injectable.dart';
import 'dart:developer' as developer;

import '../../domain/services/tts_service.dart';

/// Mock implementation of [TtsService] for offline testing.
@Environment('mock')
@Injectable(as: TtsService)
class MockTtsService implements TtsService {
  String? _lastText;

  @override
  Future<void> synthesizeAndPlay(String text) async {
    _lastText = text;
    developer.log('Mock TTS playing: $text');
    
    // Simulate playback duration based on text length
    final durationMs = text.length * 50;
    await Future.delayed(Duration(milliseconds: durationMs));
  }

  @override
  Future<void> replayLast() async {
    if (_lastText != null) {
      await synthesizeAndPlay(_lastText!);
    }
  }
}
