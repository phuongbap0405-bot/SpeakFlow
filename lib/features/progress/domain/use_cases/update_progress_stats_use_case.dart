import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/entities/progress_stats.dart';
import '../../domain/repositories/progress_repository.dart';
import '../../../history/domain/entities/session.dart';

/// Recalculates and persists [ProgressStats] after a session ends.
///
/// Updates:
/// - `sessionsCompleted` incremented by 1
/// - `totalSpeakingTimeSeconds` increased by the sum of all turn recording durations
/// - `currentStreakDays` updated according to streak logic:
///   - Same calendar day as last session → unchanged
///   - Next calendar day → +1
///   - Gap > 1 day → reset to 1
/// - `lastSessionDate` set to the session's end time
///
/// Returns [Left(StorageFailure)] on any error, otherwise [Right(ProgressStats)]
/// with the updated stats.
@injectable
class UpdateProgressStatsUseCase {
  final ProgressRepository _progressRepository;

  UpdateProgressStatsUseCase(this._progressRepository);

  Future<Either<Failure, ProgressStats>> call({
    required Session completedSession,
  }) async {
    try {
      final current = await _progressRepository.getStats();

      // Sum all turn recording durations in seconds.
      final addedSeconds = completedSession.turns.fold<int>(
        0,
        (sum, turn) => sum + (turn.recordingDurationMs ~/ 1000),
      );

      // Streak calculation.
      final sessionDay =
          SpeakFlowDateUtils.dateOnly(completedSession.endTime);
      final updatedStreak = _calculateStreak(
        current: current,
        sessionDay: sessionDay,
      );

      final updated = current.copyWith(
        sessionsCompleted: current.sessionsCompleted + 1,
        totalSpeakingTimeSeconds:
            current.totalSpeakingTimeSeconds + addedSeconds,
        currentStreakDays: updatedStreak,
        lastSessionDate: completedSession.endTime,
      );

      await _progressRepository.saveStats(updated);
      return Right(updated);
    } catch (e) {
      return Left(Failure.storageError(e.toString()));
    }
  }

  int _calculateStreak({
    required ProgressStats current,
    required DateTime sessionDay,
  }) {
    final lastSessionDate = current.lastSessionDate;
    if (lastSessionDate == null) {
      return 1;
    }

    final lastDay = SpeakFlowDateUtils.dateOnly(lastSessionDate);

    if (sessionDay == lastDay) {
      // Same calendar day — streak unchanged.
      return current.currentStreakDays;
    }

    final dayDiff = sessionDay.difference(lastDay).inDays;
    if (dayDiff == 1) {
      // Consecutive day — increment streak.
      return current.currentStreakDays + 1;
    } else {
      // Gap > 1 day — reset streak.
      return 1;
    }
  }
}
