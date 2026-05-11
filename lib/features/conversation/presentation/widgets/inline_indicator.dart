import 'package:flutter/material.dart';

/// A small tappable icon/badge shown on a user bubble when grammar corrections
/// are available for that turn.
///
/// Tapping dispatches [CorrectionsOpened] via the [onTap] callback.
class InlineIndicator extends StatelessWidget {
  final VoidCallback onTap;

  const InlineIndicator({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.spellcheck_rounded,
          size: 16,
          color: Colors.orange,
        ),
      ),
    );
  }
}
