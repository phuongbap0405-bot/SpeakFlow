import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/services/tts_service.dart';

/// On-device TTS implementation using the `flutter_tts` package.
///
/// Completely free — no API key or network request required.
/// Uses the device's built-in speech synthesis engine.
@Environment(Environment.dev)
@Environment(Environment.prod)
@Injectable(as: TtsService)
class FlutterTtsService implements TtsService {
  final FlutterTts _tts = FlutterTts();

  String? _lastText;

  FlutterTtsService() {
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.5);  // slightly slower for learners
    _tts.setVolume(1.0);
    _tts.setPitch(1.0);
  }

  @override
  Future<void> synthesizeAndPlay(String text) async {
    try {
      _lastText = text;
      await _tts.awaitSpeakCompletion(true);
      final result = await _tts.speak(text);
      if (result != 1) {
        throw TtsException('flutter_tts speak() returned error code: $result');
      }
    } catch (e) {
      if (e is TtsException) rethrow;
      throw TtsException('TTS playback failed: $e');
    }
  }

  @override
  Future<void> replayLast() async {
    final text = _lastText;
    if (text == null) return;
    await synthesizeAndPlay(text);
  }
}
