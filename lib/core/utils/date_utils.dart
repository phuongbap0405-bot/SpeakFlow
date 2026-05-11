/// Utility helpers for date operations used in streak calculation.
///
/// Named [SpeakFlowDateUtils] to avoid collision with Flutter's [DateUtils].
class SpeakFlowDateUtils {
  SpeakFlowDateUtils._();

  /// Returns a [DateTime] with only the year, month, and day components,
  /// with the time portion zeroed out (midnight UTC).
  ///
  /// Used for streak day comparison so that two [DateTime] values on the
  /// same calendar day compare as equal regardless of their time-of-day.
  ///
  /// Example:
  /// ```dart
  /// final d = SpeakFlowDateUtils.dateOnly(DateTime(2024, 1, 15, 10, 30));
  /// // d == DateTime(2024, 1, 15, 0, 0, 0)
  /// ```
  static DateTime dateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
