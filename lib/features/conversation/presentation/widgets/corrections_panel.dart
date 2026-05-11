import 'package:flutter/material.dart';

import '../../domain/entities/grammar_correction.dart';

/// A bottom sheet that lists all [GrammarCorrection]s for a turn.
///
/// Use [CorrectionsPanel.show] to display it modally.
class CorrectionsPanel extends StatelessWidget {
  final List<GrammarCorrection> corrections;
  final VoidCallback onDismiss;

  const CorrectionsPanel({
    super.key,
    required this.corrections,
    required this.onDismiss,
  });

  /// Shows the corrections panel as a modal bottom sheet.
  static void show(
    BuildContext context,
    List<GrammarCorrection> corrections,
    VoidCallback onDismiss,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => CorrectionsPanel(
        corrections: corrections,
        onDismiss: onDismiss,
      ),
    ).then((_) => onDismiss());
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.spellcheck_rounded, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    'Grammar Corrections',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: corrections.isEmpty
                  ? const Center(
                      child: Text('No corrections for this turn.'),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: corrections.length,
                      separatorBuilder: (_, _) => const Divider(height: 24),
                      itemBuilder: (context, index) {
                        final correction = corrections[index];
                        return _CorrectionItem(correction: correction);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _CorrectionItem extends StatelessWidget {
  final GrammarCorrection correction;

  const _CorrectionItem({required this.correction});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Original phrase — strikethrough red
        Text(
          correction.originalPhrase,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.red.shade700,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red.shade700,
          ),
        ),
        const SizedBox(height: 4),
        // Suggested correction — green
        Text(
          correction.suggestedCorrection,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.green.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        // Explanation
        Text(
          correction.explanation,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
