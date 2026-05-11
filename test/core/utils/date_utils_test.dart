import 'package:flutter_test/flutter_test.dart';
import 'package:speakflow/core/utils/date_utils.dart';

void main() {
  group('SpeakFlowDateUtils.dateOnly', () {
    test('zeroes out time components', () {
      final input = DateTime(2024, 1, 15, 10, 30, 45, 123);
      final result = SpeakFlowDateUtils.dateOnly(input);
      expect(result, equals(DateTime(2024, 1, 15)));
      expect(result.hour, 0);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
    });

    test('two DateTimes on the same calendar day compare equal after dateOnly', () {
      final morning = DateTime(2024, 6, 10, 8, 0);
      final evening = DateTime(2024, 6, 10, 22, 59, 59);
      expect(
        SpeakFlowDateUtils.dateOnly(morning),
        equals(SpeakFlowDateUtils.dateOnly(evening)),
      );
    });

    test('two DateTimes on different calendar days compare unequal after dateOnly', () {
      final day1 = DateTime(2024, 6, 10, 23, 59);
      final day2 = DateTime(2024, 6, 11, 0, 0);
      expect(
        SpeakFlowDateUtils.dateOnly(day1),
        isNot(equals(SpeakFlowDateUtils.dateOnly(day2))),
      );
    });

    test('difference in days is 1 for consecutive calendar days', () {
      final today = SpeakFlowDateUtils.dateOnly(DateTime(2024, 1, 15, 15, 0));
      final yesterday = SpeakFlowDateUtils.dateOnly(DateTime(2024, 1, 14, 23, 0));
      expect(today.difference(yesterday).inDays, 1);
    });

    test('preserves year, month, day fields', () {
      final input = DateTime(2023, 12, 31, 23, 59, 59);
      final result = SpeakFlowDateUtils.dateOnly(input);
      expect(result.year, 2023);
      expect(result.month, 12);
      expect(result.day, 31);
    });

    test('midnight input is unchanged', () {
      final midnight = DateTime(2024, 3, 5, 0, 0, 0);
      expect(SpeakFlowDateUtils.dateOnly(midnight), equals(midnight));
    });
  });
}
