import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_stats.freezed.dart';
part 'progress_stats.g.dart';

@freezed
abstract class ProgressStats with _$ProgressStats {
  const factory ProgressStats({
    required int sessionsCompleted,
    required int totalSpeakingTimeSeconds,
    required int currentStreakDays,
    /// ISO-8601 date of the last completed session (nullable).
    DateTime? lastSessionDate,
  }) = _ProgressStats;

  factory ProgressStats.fromJson(Map<String, dynamic> json) =>
      _$ProgressStatsFromJson(json);
}
