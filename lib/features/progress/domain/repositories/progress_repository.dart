import '../entities/progress_stats.dart';

abstract class ProgressRepository {
  Future<ProgressStats> getStats();
  Future<void> saveStats(ProgressStats stats);
}
