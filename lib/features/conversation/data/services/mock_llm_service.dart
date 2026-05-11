import 'package:injectable/injectable.dart';

import '../../domain/entities/grammar_correction.dart';
import '../../domain/entities/llm_response.dart';
import '../../domain/entities/turn.dart';
import '../../domain/services/llm_service.dart';

/// Mock implementation of [LlmService] for offline testing.
@Environment('mock')
@Injectable(as: LlmService)
class MockLlmService implements LlmService {
  @override
  Future<LlmResponse> generateResponse({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final isLikelyGreeting = userMessage.toLowerCase().contains('hello') || 
                           userMessage.toLowerCase().contains('hi');

    if (isLikelyGreeting) {
      return const LlmResponse(
        responseText: "Hello! I'm your English tutor. Ready to practice speaking?",
        grammarCorrections: [],
      );
    }

    // Return a generic response with a mock correction.
    return LlmResponse(
      responseText: "That's very interesting! Tell me more about $topic.",
      grammarCorrections: [
        if (userMessage.length < 10)
          const GrammarCorrection(
            originalPhrase: "Short message",
            suggestedCorrection: "Could you please provide a more detailed answer?",
            explanation: "Try to speak in full sentences to improve your fluency.",
          ),
      ],
    );
  }
}
