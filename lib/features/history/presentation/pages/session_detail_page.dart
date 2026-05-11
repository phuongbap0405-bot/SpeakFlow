import 'package:flutter/material.dart';

import '../../domain/entities/session.dart';
import '../../../conversation/domain/entities/turn.dart';
import '../../../conversation/domain/entities/grammar_correction.dart';

/// Read-only view of a past conversation session.
class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          session.topic,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: session.turns.isEmpty
          ? const Center(
              child: Text('No turns recorded for this session.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: session.turns.length,
              itemBuilder: (context, index) {
                final turn = session.turns[index];
                return _TurnCard(turn: turn);
              },
            ),
    );
  }
}

class _TurnCard extends StatelessWidget {
  final Turn turn;

  const _TurnCard({required this.turn});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasCorrections = turn.grammarCorrections.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // User bubble
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                child: Icon(Icons.person, size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        turn.transcription,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    if (hasCorrections)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.spellcheck,
                              size: 14,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${turn.grammarCorrections.length} correction(s)',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // AI bubble
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.teal,
                child: Icon(Icons.smart_toy, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    turn.aiResponse,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          // Grammar corrections (read-only expansion)
          if (hasCorrections) ...[
            const SizedBox(height: 8),
            _CorrectionsSection(corrections: turn.grammarCorrections),
          ],
        ],
      ),
    );
  }
}

class _CorrectionsSection extends StatefulWidget {
  final List<GrammarCorrection> corrections;

  const _CorrectionsSection({required this.corrections});

  @override
  State<_CorrectionsSection> createState() => _CorrectionsSectionState();
}

class _CorrectionsSectionState extends State<_CorrectionsSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.errorContainer.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.spellcheck, size: 16, color: Colors.orange),
                  const SizedBox(width: 6),
                  Text(
                    'Grammar Corrections (${widget.corrections.length})',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            ...widget.corrections.map((correction) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    _CorrectionRow(
                      label: 'Original',
                      value: correction.originalPhrase,
                      valueStyle: theme.textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: theme.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _CorrectionRow(
                      label: 'Suggestion',
                      value: correction.suggestedCorrection,
                      valueStyle: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _CorrectionRow(
                      label: 'Explanation',
                      value: correction.explanation,
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}

class _CorrectionRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const _CorrectionRow({
    required this.label,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            '$label:',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: valueStyle ?? theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
