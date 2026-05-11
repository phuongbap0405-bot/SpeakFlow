import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/grammar_correction.dart';
import '../../domain/entities/llm_response.dart';
import '../../domain/entities/turn.dart';
import '../../domain/services/llm_service.dart';
import '../../../../core/error/exceptions.dart';
import '../dto/grammar_correction_dto.dart';
import '../dto/gpt_response_dto.dart';

/// OpenAI GPT-4o implementation of [LlmService].
///
/// Sends the full conversation history plus the current user message to the
/// `/chat/completions` endpoint and parses the structured JSON reply into an
/// [LlmResponse] containing the AI's conversational reply and any grammar
/// corrections for the user's message.
// OpenAI GPT-4o LLM — requires paid API key.
// To use: remove @Injectable from GeminiLlmService and re-enable this annotation.
// @Injectable(as: LlmService)
class OpenAiLlmService implements LlmService {
  const OpenAiLlmService(this._dio);

  final Dio _dio;

  static const String _endpoint = '/chat/completions';
  static const String _model = 'gpt-4o';

  /// Builds the system prompt that instructs GPT-4o to act as a conversation
  /// tutor and return a structured JSON response.
  String _buildSystemPrompt(String topic) {
    return '''You are a friendly English conversation tutor. The topic is: $topic.
Respond conversationally to the user's message. Also identify any grammar errors in the user's message. Return your answer as JSON:
{
  "response": "<your conversational reply>",
  "corrections": [
    { "originalPhrase": "...", "suggestedCorrection": "...", "explanation": "..." }
  ]
}
If there are no grammar errors, return an empty array for corrections.''';
  }

  /// Converts the conversation history into the OpenAI message array format.
  ///
  /// Each [Turn] contributes two messages: the user's transcription and the
  /// AI's previous response. The current user message is appended last.
  List<Map<String, String>> _buildMessages({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  }) {
    final messages = <Map<String, String>>[
      {'role': 'system', 'content': _buildSystemPrompt(topic)},
    ];

    // Append prior turns in chronological order (oldest first).
    for (final turn in conversationHistory) {
      messages.add({'role': 'user', 'content': turn.transcription});
      messages.add({'role': 'assistant', 'content': turn.aiResponse});
    }

    // Append the current user message.
    messages.add({'role': 'user', 'content': userMessage});

    return messages;
  }

  @override
  Future<LlmResponse> generateResponse({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  }) async {
    final messages = _buildMessages(
      topic: topic,
      userMessage: userMessage,
      conversationHistory: conversationHistory,
    );

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _endpoint,
        data: {
          'model': _model,
          'messages': messages,
          // Ask the model to return pure JSON without markdown fences.
          'response_format': {'type': 'json_object'},
        },
      );

      final data = response.data;
      if (data == null) {
        throw const LlmException('Empty response from OpenAI chat completions');
      }

      final gptResponse = GptResponseDto.fromJson(data);

      if (gptResponse.choices.isEmpty) {
        throw const LlmException('No choices returned by OpenAI');
      }

      final content = gptResponse.choices.first.message.content;

      // Parse the JSON content string returned by the model.
      final Map<String, dynamic> parsed;
      try {
        parsed = jsonDecode(content) as Map<String, dynamic>;
      } catch (_) {
        throw LlmException('Failed to parse JSON from model content: $content');
      }

      final responseText = parsed['response'] as String?;
      if (responseText == null || responseText.isEmpty) {
        throw LlmException(
          'Missing or empty "response" field in model JSON: $content',
        );
      }

      final correctionsRaw = parsed['corrections'];
      final List<GrammarCorrection> grammarCorrections;

      if (correctionsRaw is List) {
        grammarCorrections = correctionsRaw
            .whereType<Map<String, dynamic>>()
            .map(GrammarCorrectionDto.fromJson)
            .map(
              (dto) => GrammarCorrection(
                originalPhrase: dto.originalPhrase,
                suggestedCorrection: dto.suggestedCorrection,
                explanation: dto.explanation,
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
        'Network error calling OpenAI chat completions: ${e.message}',
      );
    } catch (e) {
      throw LlmException('Unexpected error in OpenAiLlmService: $e');
    }
  }
}
