import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/grammar_correction.dart';
import '../../domain/entities/llm_response.dart';
import '../../domain/entities/turn.dart';
import '../../domain/services/llm_service.dart';

/// Gemini 1.5 Flash implementation of [LlmService].
///
/// Uses the free Gemini API (Google AI Studio key — no billing required).
/// Pass the key at build time:
///   flutter run --dart-define=GEMINI_API_KEY=AIza...
///
/// The model returns a structured JSON response with the conversational
/// reply and any grammar corrections.
@Environment(Environment.dev)
@Environment(Environment.prod)
@Injectable(as: LlmService)
class GeminiLlmService implements LlmService {
  final Dio _dio;

  static const String _apiKey = AppConfig.geminiApiKey;

  static const String _model = 'gemini-2.5-flash';

  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  GeminiLlmService(this._dio);

  String _buildSystemInstruction(String topic) {
    return '''You are a friendly English conversation tutor. The topic is: $topic.
Respond conversationally to the user's message. Also identify any grammar errors in the user's message.
Return ONLY a valid JSON object (no markdown, no code fences) with this exact structure:
{
  "response": "<your conversational reply>",
  "corrections": [
    { "originalPhrase": "...", "suggestedCorrection": "...", "explanation": "..." }
  ]
}
If there are no grammar errors, return an empty array for corrections.''';
  }

  /// Builds the Gemini `contents` array from conversation history.
  ///
  /// Gemini uses `user` and `model` roles (not `assistant`).
  List<Map<String, dynamic>> _buildContents({
    required List<Turn> conversationHistory,
    required String userMessage,
  }) {
    final contents = <Map<String, dynamic>>[];

    for (final turn in conversationHistory) {
      contents.add({
        'role': 'user',
        'parts': [
          {'text': turn.transcription}
        ],
      });
      contents.add({
        'role': 'model',
        'parts': [
          {'text': turn.aiResponse}
        ],
      });
    }

    contents.add({
      'role': 'user',
      'parts': [
        {'text': userMessage}
      ],
    });

    return contents;
  }

  @override
  Future<LlmResponse> generateResponse({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  }) async {
    final url = '$_baseUrl/$_model:generateContent?key=$_apiKey';

    final body = {
      'system_instruction': {
        'parts': [
          {'text': _buildSystemInstruction(topic)}
        ],
      },
      'contents': _buildContents(
        conversationHistory: conversationHistory,
        userMessage: userMessage,
      ),
      'generationConfig': {
        'responseMimeType': 'application/json',
      },
    };

    try {
      // Use a plain Dio instance without the OpenAI base URL/headers.
      final response = await _dio.post<Map<String, dynamic>>(
        url,
        data: body,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          // Override base URL by using a full URL in the path.
          extra: {'baseUrl': ''},
        ),
      );

      final data = response.data;
      if (data == null) {
        throw const LlmException('Empty response from Gemini API');
      }

      // Gemini response shape:
      // { "candidates": [{ "content": { "parts": [{ "text": "..." }] } }] }
      final candidates = data['candidates'] as List?;
      if (candidates == null || candidates.isEmpty) {
        throw const LlmException('No candidates returned by Gemini');
      }

      final parts =
          (candidates.first as Map)['content']?['parts'] as List?;
      if (parts == null || parts.isEmpty) {
        throw const LlmException('No parts in Gemini response');
      }

      final rawText = (parts.first as Map)['text'] as String?;
      if (rawText == null || rawText.isEmpty) {
        throw const LlmException('Empty text in Gemini response');
      }

      // Parse the JSON the model returned.
      final Map<String, dynamic> parsed;
      try {
        parsed = jsonDecode(rawText) as Map<String, dynamic>;
      } catch (_) {
        throw LlmException(
            'Failed to parse JSON from Gemini response: $rawText');
      }

      final responseText = parsed['response'] as String?;
      if (responseText == null || responseText.isEmpty) {
        throw LlmException(
            'Missing "response" field in Gemini JSON: $rawText');
      }

      final correctionsRaw = parsed['corrections'];
      final List<GrammarCorrection> grammarCorrections;

      if (correctionsRaw is List) {
        grammarCorrections = correctionsRaw
            .whereType<Map<String, dynamic>>()
            .map(
              (c) => GrammarCorrection(
                originalPhrase: c['originalPhrase'] as String? ?? '',
                suggestedCorrection:
                    c['suggestedCorrection'] as String? ?? '',
                explanation: c['explanation'] as String? ?? '',
              ),
            )
            .toList();
      } else {
        grammarCorrections = const [];
      }

      return LlmResponse(
        responseText: responseText,
        grammarCorrections: grammarCorrections,
      );
    } on LlmException {
      rethrow;
    } on DioException catch (e) {
      throw LlmException(
          'Network error calling Gemini API: ${e.message}');
    } catch (e) {
      throw LlmException('Unexpected error in GeminiLlmService: $e');
    }
  }
}
