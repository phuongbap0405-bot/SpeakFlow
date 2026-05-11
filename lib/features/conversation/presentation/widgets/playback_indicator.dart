import 'package:flutter/material.dart';

/// Animated pulsing speaker icon shown on the AI bubble during TTS playback.
class PlaybackIndicator extends StatefulWidget {
  const PlaybackIndicator({super.key});

  @override
  State<PlaybackIndicator> createState() => _PlaybackIndicatorState();
}

class _PlaybackIndicatorState extends State<PlaybackIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(
        Icons.volume_up_rounded,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
