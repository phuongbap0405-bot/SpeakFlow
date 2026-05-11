import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failures.dart';
import '../../../history/domain/entities/session.dart';

/// Creates a new [Session] with the given topic.
///
/// Validates that the topic is between 1 and 200 characters (inclusive).
/// Returns [Left(StorageFailure)] if validation fails, otherwise [Right(Session)].
@injectable
class StartSessionUseCase {
  final Uuid _uuid;

  StartSessionUseCase(this._uuid);

  Either<Failure, Session> call({required String topic}) {
    final trimmed = topic.trim();
    if (trimmed.isEmpty || trimmed.length > 200) {
      return Left(
        const Failure.storageError(
          'Topic must be between 1 and 200 characters.',
        ),
      );
    }

    final session = Session(
      id: _uuid.v4(),
      topic: trimmed,
      startTime: DateTime.now(),
      // endTime is a placeholder; it will be set when the session ends.
      endTime: DateTime.now(),
      turns: const [],
    );

    return Right(session);
  }
}
