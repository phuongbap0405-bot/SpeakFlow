// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressStats _$ProgressStatsFromJson(Map<String, dynamic> json) =>
    _ProgressStats(
      sessionsCompleted: (json['sessionsCompleted'] as num).toInt(),
      totalSpeakingTimeSeconds: (json['totalSpeakingTimeSeconds'] as num)
          .toInt(),
      currentStreakDays: (json['currentStreakDays'] as num).toInt(),
      lastSessionDate: json['lastSessionDate'] == null
          ? null
          : DateTime.parse(json['lastSessionDate'] as String),
    );

Map<String, dynamic> _$ProgressStatsToJson(_ProgressStats instance) =>
    <String, dynamic>{
      'sessionsCompleted': instance.sessionsCompleted,
      'totalSpeakingTimeSeconds': instance.totalSpeakingTimeSeconds,
      'currentStreakDays': instance.currentStreakDays,
      'lastSessionDate': instance.lastSessionDate?.toIso8601String(),
    };
