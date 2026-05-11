import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/progress_stats.dart';
import '../repositories/progress_repository.dart';

/// Returns the current [ProgressStats].
///
/// Returns [Left(StorageFailure)] on any error, otherwise [Right(ProgressStats)].
@injectable
class GetProgressStatsUseCase {
  final ProgressRepository _progressRepository;

  GetProgressStatsUseCase(this._progressRepository);

  Future<Either<Failure, ProgressStats>> call() async {
    try {
      final stats = await _progressRepository.getStats();
      return Right(stats);
    } catch (e) {
      return Left(Failure.storageError(e.toString()));
    }
  }
}
