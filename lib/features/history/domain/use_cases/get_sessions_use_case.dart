import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/session.dart';
import '../repositories/conversation_repository.dart';

/// Returns all sessions in reverse chronological order (most recent first).
///
/// Returns [Left(StorageFailure)] on any error, otherwise [Right(List<Session>)].
@injectable
class GetSessionsUseCase {
  final ConversationRepository _conversationRepository;

  GetSessionsUseCase(this._conversationRepository);

  Future<Either<Failure, List<Session>>> call() async {
    try {
      final sessions = await _conversationRepository.getAllSessions();
      // Sort descending by startTime (most recent first).
      final sorted = List<Session>.from(sessions)
        ..sort((a, b) => b.startTime.compareTo(a.startTime));
      return Right(sorted);
    } catch (e) {
      return Left(Failure.storageError(e.toString()));
    }
  }
}
