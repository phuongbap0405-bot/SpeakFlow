import '../entities/llm_response.dart';
import '../entities/turn.dart';

abstract class LlmService {
  Future<LlmResponse> generateResponse({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  });
}
