import 'package:flutter/material.dart';

/// Displays a recording elapsed time in MM:SS format.
///
/// Updated every second by the [ConversationBloc] via the [Recording] state.
class RecordingTimer extends StatelessWidget {
  final Duration elapsed;

  const RecordingTimer({super.key, required this.elapsed});

  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.fiber_manual_record, color: Colors.red, size: 14),
        const SizedBox(width: 4),
        Text(
          _format(elapsed),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.red,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
        ),
      ],
    );
  }
}
