/// Utility helpers for formatting durations in the progress display.
class DurationFormatter {
  DurationFormatter._();

  /// Converts a total number of [seconds] into an `H:MM` string.
  ///
  /// The result satisfies:
  ///   `hours * 3600 + minutes * 60 <= seconds < hours * 3600 + (minutes + 1) * 60`
  ///
  /// Sub-minute remainders are truncated (rounded down to whole minutes).
  ///
  /// Examples:
  /// ```dart
  /// DurationFormatter.formatAsHoursMinutes(3661); // "1:01"
  /// DurationFormatter.formatAsHoursMinutes(7200); // "2:00"
  /// DurationFormatter.formatAsHoursMinutes(59);   // "0:00"
  /// DurationFormatter.formatAsHoursMinutes(0);    // "0:00"
  /// ```
  static String formatAsHoursMinutes(int seconds) {
    assert(seconds >= 0, 'seconds must be non-negative');
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}';
  }
}
