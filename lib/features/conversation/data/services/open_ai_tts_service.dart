import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/services/tts_service.dart';

/// OpenAI TTS implementation of [TtsService].
///
/// POSTs to `/audio/speech` with `model: tts-1` and `voice: alloy`, saves
/// the returned audio bytes to a fixed temp file, and plays it via
/// [AudioPlayer]. The last audio file path is cached so [replayLast] can
/// replay it without a new network request.
///
/// The [Dio] instance is expected to have the OpenAI base URL
/// (`https://api.openai.com/v1`) and the `Authorization` header already
/// configured via the DI container.
// OpenAI TTS — requires paid API key.
// To use: remove @Injectable from FlutterTtsService and re-enable this annotation.
// @Injectable(as: TtsService)
class OpenAiTtsService implements TtsService {
  final Dio _dio;
  final AudioPlayer _player;

  String? _lastAudioPath;

  OpenAiTtsService(this._dio) : _player = AudioPlayer();

  @override
  Future<void> synthesizeAndPlay(String text) async {
    try {
      final response = await _dio.post<List<int>>(
        '/audio/speech',
        data: {
          'model': 'tts-1',
          'voice': 'alloy',
          'input': text,
        },
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = response.data!;
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/speakflow_tts_last.mp3';
      await File(filePath).writeAsBytes(bytes, flush: true);
      _lastAudioPath = filePath;

      await _playFile(filePath);
    } on DioException catch (e) {
      throw TtsException(
        e.message ?? 'Unknown error from OpenAI TTS service',
      );
    } catch (e) {
      throw TtsException('TTS playback failed: $e');
    }
  }

  @override
  Future<void> replayLast() async {
    final path = _lastAudioPath;
    if (path == null) return;

    try {
      await _playFile(path);
    } catch (e) {
      throw TtsException('TTS replay failed: $e');
    }
  }

  Future<void> _playFile(String filePath) async {
    await _player.setFilePath(filePath);
    await _player.play();
    // Wait until playback finishes naturally.
    await _player.processingStateStream.firstWhere(
      (state) => state == ProcessingState.completed,
    );
  }
}
