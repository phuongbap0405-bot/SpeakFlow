import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/llm_response.dart';
import '../entities/turn.dart';
import '../services/llm_service.dart';

/// Delegates to [LlmService] with the full conversation history context and
/// returns the generated [LlmResponse].
///
/// Returns [Left(LlmFailure)] on any error, otherwise [Right(LlmResponse)].
@injectable
class GenerateTurnResponseUseCase {
  final LlmService _llmService;

  GenerateTurnResponseUseCase(this._llmService);

  Future<Either<Failure, LlmResponse>> call({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  }) async {
    try {
      final response = await _llmService.generateResponse(
        topic: topic,
        userMessage: userMessage,
        conversationHistory: conversationHistory,
      );
      return Right(response);
    } catch (e) {
      return Left(Failure.llmError(e.toString()));
    }
  }
}
