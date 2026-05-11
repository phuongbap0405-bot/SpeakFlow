import 'package:flutter_test/flutter_test.dart';
import 'package:speakflow/core/utils/duration_formatter.dart';

void main() {
  group('DurationFormatter.formatAsHoursMinutes', () {
    test('0 seconds returns "0:00"', () {
      expect(DurationFormatter.formatAsHoursMinutes(0), '0:00');
    });

    test('59 seconds (less than one minute) returns "0:00"', () {
      expect(DurationFormatter.formatAsHoursMinutes(59), '0:00');
    });

    test('60 seconds returns "0:01"', () {
      expect(DurationFormatter.formatAsHoursMinutes(60), '0:01');
    });

    test('3600 seconds (1 hour) returns "1:00"', () {
      expect(DurationFormatter.formatAsHoursMinutes(3600), '1:00');
    });

    test('3661 seconds returns "1:01"', () {
      expect(DurationFormatter.formatAsHoursMinutes(3661), '1:01');
    });

    test('7200 seconds (2 hours) returns "2:00"', () {
      expect(DurationFormatter.formatAsHoursMinutes(7200), '2:00');
    });

    test('minutes are zero-padded to two digits', () {
      expect(DurationFormatter.formatAsHoursMinutes(3660), '1:01');
      expect(DurationFormatter.formatAsHoursMinutes(3600 + 9 * 60), '1:09');
    });

    test('sub-minute remainder is truncated (not rounded)', () {
      // 3659 = 1h 0m 59s → "1:00", not "1:01"
      expect(DurationFormatter.formatAsHoursMinutes(3659), '1:00');
    });

    test('large value: 36000 seconds (10 hours) returns "10:00"', () {
      expect(DurationFormatter.formatAsHoursMinutes(36000), '10:00');
    });

    test('satisfies floor invariant: hours*3600 + minutes*60 <= seconds', () {
      const testValues = [0, 1, 59, 60, 61, 3599, 3600, 3661, 7200, 7319, 36000];
      for (final s in testValues) {
        final formatted = DurationFormatter.formatAsHoursMinutes(s);
        final parts = formatted.split(':');
        final hours = int.parse(parts[0]);
        final minutes = int.parse(parts[1]);
        final lower = hours * 3600 + minutes * 60;
        final upper = hours * 3600 + (minutes + 1) * 60;
        expect(
          lower <= s && s < upper,
          isTrue,
          reason: 'formatAsHoursMinutes($s) = "$formatted" violates floor invariant',
        );
      }
    });
  });
}
