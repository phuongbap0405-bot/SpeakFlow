import 'package:flutter/material.dart';

/// Floating action button for starting/stopping audio recording.
///
/// - When [isEnabled] is false (during TTS playback or AI processing), the
///   button is greyed out and non-interactive.
/// - When [isRecording] is true, shows a red stop icon.
/// - Otherwise shows a blue microphone icon.
class RecordButton extends StatelessWidget {
  final bool isEnabled;
  final bool isRecording;
  final VoidCallback? onPressed;

  const RecordButton({
    super.key,
    required this.isEnabled,
    required this.isRecording,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final Color foregroundColor;
    final IconData icon;

    if (!isEnabled) {
      backgroundColor = Colors.grey.shade400;
      foregroundColor = Colors.white;
      icon = Icons.mic_off_rounded;
    } else if (isRecording) {
      backgroundColor = Colors.red;
      foregroundColor = Colors.white;
      icon = Icons.stop_rounded;
    } else {
      backgroundColor = Theme.of(context).colorScheme.primary;
      foregroundColor = Colors.white;
      icon = Icons.mic_rounded;
    }

    return FloatingActionButton(
      onPressed: isEnabled ? onPressed : null,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      tooltip: isRecording ? 'Stop recording' : 'Start recording',
      child: Icon(icon),
    );
  }
}
