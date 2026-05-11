import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/history_bloc.dart';
import '../bloc/history_event.dart';
import '../bloc/history_state.dart';
import 'session_detail_page.dart';

/// Entry point for the history screen. Provides [HistoryBloc] and
/// dispatches [HistoryLoaded] on first build.
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (_) =>
          GetIt.instance<HistoryBloc>()..add(const HistoryEvent.loadHistory()),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is SessionDetailLoaded) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => SessionDetailPage(session: state.session),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            HistoryLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HistoryLoaded(:final sessions) => sessions.isEmpty
                ? const Center(
                    child: Text(
                      'No sessions yet.\nStart a conversation to see your history.',
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: sessions.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      return ListTile(
                        leading: const Icon(Icons.chat_bubble_outline),
                        title: Text(
                          session.topic,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          _formatDate(session.startTime),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context
                            .read<HistoryBloc>()
                            .add(HistoryEvent.sessionSelected(session.id)),
                      );
                    },
                  ),
            SessionDetailLoaded() =>
              // Navigation is handled by BlocListener; show loading while
              // the push animation plays.
              const Center(child: CircularProgressIndicator()),
            HistoryError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 12),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<HistoryBloc>()
                          .add(const HistoryEvent.loadHistory()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final local = dateTime.toLocal();
    final year = local.year;
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute';
  }
}
