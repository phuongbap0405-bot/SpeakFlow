import 'package:flutter/material.dart';

import '../../../../core/utils/duration_formatter.dart';
import '../../domain/entities/progress_stats.dart';

/// Displays the three key progress stats: sessions completed, total speaking
/// time formatted as H:MM, and current streak in days.
class ProgressCard extends StatelessWidget {
  final ProgressStats stats;

  const ProgressCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedTime =
        DurationFormatter.formatAsHoursMinutes(stats.totalSpeakingTimeSeconds);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatItem(
              label: 'Sessions',
              value: '${stats.sessionsCompleted}',
              icon: Icons.check_circle_outline,
              theme: theme,
            ),
            _Divider(),
            _StatItem(
              label: 'Speaking Time',
              value: formattedTime,
              icon: Icons.mic_none,
              theme: theme,
            ),
            _Divider(),
            _StatItem(
              label: 'Streak',
              value: '${stats.currentStreakDays}d',
              icon: Icons.local_fire_department_outlined,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final ThemeData theme;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: theme.colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: VerticalDivider(
        color: Theme.of(context).dividerColor,
        thickness: 1,
        width: 1,
      ),
    );
  }
}
