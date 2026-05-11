import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/progress_stats.dart';
import '../../domain/repositories/progress_repository.dart';

/// [SharedPreferences]-backed implementation of [ProgressRepository].
///
/// Progress stats are stored as a JSON string under the key
/// [_kProgressKey]. The [ProgressStats.lastSessionDate] field is
/// serialized as an ISO-8601 date string (`yyyy-MM-dd`) by
/// `json_serializable` / freezed.
@Injectable(as: ProgressRepository)
class SharedPrefsProgressRepository implements ProgressRepository {
  final SharedPreferences _prefs;

  static const String _kProgressKey = 'speakflow_progress';

  const SharedPrefsProgressRepository(this._prefs);

  /// Returns the stored [ProgressStats], or a zeroed-out default when no
  /// data has been saved yet.
  ///
  /// Throws [StorageException] if the stored JSON cannot be decoded.
  @override
  Future<ProgressStats> getStats() async {
    try {
      final raw = _prefs.getString(_kProgressKey);
      if (raw == null || raw.isEmpty) {
        return const ProgressStats(
          sessionsCompleted: 0,
          totalSpeakingTimeSeconds: 0,
          currentStreakDays: 0,
          lastSessionDate: null,
        );
      }
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return ProgressStats.fromJson(json);
    } catch (e) {
      throw StorageException('Failed to load progress stats: $e');
    }
  }

  /// Persists [stats] to [SharedPreferences] as a JSON string.
  ///
  /// Throws [StorageException] if the write fails.
  @override
  Future<void> saveStats(ProgressStats stats) async {
    try {
      final json = stats.toJson();
      final raw = jsonEncode(json);
      await _prefs.setString(_kProgressKey, raw);
    } catch (e) {
      throw StorageException('Failed to save progress stats: $e');
    }
  }
}
