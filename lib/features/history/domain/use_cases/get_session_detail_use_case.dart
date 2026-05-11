import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/session.dart';
import '../repositories/conversation_repository.dart';

/// Returns a single [Session] by its ID.
///
/// Returns [Left(StorageFailure)] if the session is not found or on any error,
/// otherwise [Right(Session)].
@injectable
class GetSessionDetailUseCase {
  final ConversationRepository _conversationRepository;

  GetSessionDetailUseCase(this._conversationRepository);

  Future<Either<Failure, Session>> call({required String sessionId}) async {
    try {
      final session = await _conversationRepository.getSessionById(sessionId);
      if (session == null) {
        return Left(
          Failure.storageError('Session with id "$sessionId" not found.'),
        );
      }
      return Right(session);
    } catch (e) {
      return Left(Failure.storageError(e.toString()));
    }
  }
}
