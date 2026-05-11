import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../history/domain/entities/session.dart';
import '../../../history/domain/repositories/conversation_repository.dart';
import '../../../progress/domain/use_cases/update_progress_stats_use_case.dart';

/// Persists a completed [Session] via [ConversationRepository] and updates
/// [ProgressStats] via [UpdateProgressStatsUseCase].
///
/// Returns [Left(StorageFailure)] on any error, otherwise [Right(unit)].
@injectable
class EndSessionUseCase {
  final ConversationRepository _conversationRepository;
  final UpdateProgressStatsUseCase _updateProgressStatsUseCase;

  EndSessionUseCase(
    this._conversationRepository,
    this._updateProgressStatsUseCase,
  );

  Future<Either<Failure, Unit>> call({required Session session}) async {
    try {
      await _conversationRepository.saveSession(session);
    } catch (e) {
      return Left(Failure.storageError(e.toString()));
    }

    final statsResult = await _updateProgressStatsUseCase(
      completedSession: session,
    );

    return statsResult.fold(
      (failure) => Left(failure),
      (_) => const Right(unit),
    );
  }
}
