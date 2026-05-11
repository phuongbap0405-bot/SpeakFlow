import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/services/stt_service.dart';

/// Gemini multimodal implementation of [SttService].
///
/// Sends the recorded audio file to Gemini 1.5 Flash as inline base64 data
/// and asks it to transcribe the speech. Uses the same free API key as
/// [GeminiLlmService] — no separate STT service or billing required.
///
/// Pass the key at build time:
///   flutter run --dart-define=GEMINI_API_KEY=AIza...
@Environment(Environment.dev)
@Environment(Environment.prod)
@Injectable(as: SttService)
class GeminiSttService implements SttService {
  final Dio _dio;

  static const String _apiKey = AppConfig.geminiApiKey;

  static const String _model = 'gemini-2.5-flash';

  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  GeminiSttService(this._dio);

  @override
  Future<String> transcribe(String audioFilePath) async {
    final url = '$_baseUrl/$_model:generateContent?key=$_apiKey';

    try {
      // Read the audio file and encode as base64.
      final audioBytes = await File(audioFilePath).readAsBytes();
      final base64Audio = base64Encode(audioBytes);

      // Determine MIME type from extension.
      final ext = audioFilePath.split('.').last.toLowerCase();
      final mimeType = switch (ext) {
        'm4a' => 'audio/mp4',
        'mp3' => 'audio/mpeg',
        'wav' => 'audio/wav',
        'ogg' => 'audio/ogg',
        _ => 'audio/mp4',
      };

      final body = {
        'contents': [
          {
            'role': 'user',
            'parts': [
              {
                'inline_data': {
                  'mime_type': mimeType,
                  'data': base64Audio,
                },
              },
              {
                'text':
                    'Please transcribe the speech in this audio recording. '
                    'Return ONLY the transcribed text, nothing else.',
              },
            ],
          }
        ],
      };

      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: body,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      final data = response.data;
      if (data == null) {
        throw const SttException('Empty response from Gemini STT');
      }

      final candidates = data['candidates'] as List?;
      if (candidates == null || candidates.isEmpty) {
        throw const SttException('No candidates in Gemini STT response');
      }

      final parts =
          (candidates.first as Map)['content']?['parts'] as List?;
      if (parts == null || parts.isEmpty) {
        throw const SttException('No parts in Gemini STT response');
      }

      final text = (parts.first as Map)['text'] as String?;
      if (text == null || text.trim().isEmpty) {
        return ''; // No speech detected
      }

      return text.trim();
    } on SttException {
      rethrow;
    } on DioException catch (e) {
      throw SttException(
          'Network error calling Gemini STT: ${e.message}');
    } catch (e) {
      throw SttException('Unexpected error in GeminiSttService: $e');
    }
  }
}
