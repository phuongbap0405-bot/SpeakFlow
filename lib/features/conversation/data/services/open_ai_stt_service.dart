import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/services/stt_service.dart';
import '../../../../core/error/exceptions.dart';
import '../dto/whisper_response_dto.dart';

/// OpenAI Whisper implementation of [SttService].
///
/// POSTs multipart/form-data to `/audio/transcriptions` using the
/// `whisper-1` model. The [Dio] instance is expected to have the OpenAI
/// base URL (`https://api.openai.com/v1`) and the `Authorization` header
/// already configured via the DI container.
// OpenAI Whisper STT — requires paid API key.
// To use: remove @Injectable from GeminiSttService and re-enable this annotation.
// @Injectable(as: SttService)
class OpenAiSttService implements SttService {
  final Dio _dio;

  const OpenAiSttService(this._dio);

  @override
  Future<String> transcribe(String audioFilePath) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(audioFilePath),
        'model': 'whisper-1',
      });

      final response = await _dio.post<Map<String, dynamic>>(
        '/audio/transcriptions',
        data: formData,
      );

      final dto = WhisperResponseDto.fromJson(response.data!);
      return dto.text;
    } on DioException catch (e) {
      throw SttException(
        e.message ?? 'Unknown error from OpenAI STT service',
      );
    }
  }
}
