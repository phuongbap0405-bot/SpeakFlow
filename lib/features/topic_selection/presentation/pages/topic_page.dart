import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../conversation/presentation/pages/conversation_page.dart';
import '../bloc/topic_bloc.dart';
import '../bloc/topic_event.dart';
import '../bloc/topic_state.dart';
import '../widgets/custom_topic_field.dart';
import '../widgets/topic_list_tile.dart';

/// Predefined topics shown to the user.
const _kPredefinedTopics = [
  'Job Interviews',
  'Daily Life',
  'Tech Discussions',
];

/// The entry-point screen where the user selects a conversation topic
/// before starting a new [Session].
///
/// Wraps itself in a [BlocProvider] so it can be pushed directly onto the
/// navigator without requiring a parent provider.
class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopicBloc>(
      create: (_) => GetIt.instance<TopicBloc>(),
      child: const _TopicView(),
    );
  }
}

class _TopicView extends StatelessWidget {
  const _TopicView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopicBloc, TopicState>(
      listener: (context, state) {
        // TopicStarted is the freezed-generated subclass of TopicState.
        if (state is TopicStarted) {
          final session = state.session;
          // Navigate to ConversationPage when the session has been created.
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ConversationPage(session: session),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose a Topic'),
        ),
        body: const _TopicBody(),
      ),
    );
  }
}

class _TopicBody extends StatelessWidget {
  const _TopicBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicBloc, TopicState>(
      builder: (context, state) {
        // Determine which topic is currently selected (if any).
        // TopicValid and TopicStarted are freezed-generated subclasses.
        String? selectedTopic;
        if (state is TopicValid) {
          selectedTopic = state.topic;
        } else if (state is TopicStarted) {
          selectedTopic = state.session.topic;
        }

        // "Start Session" is enabled only when a valid topic is selected.
        final isStartEnabled = state is TopicValid;

        // Show a loading spinner inside the button while the session is
        // being created. TopicStarting is a freezed-generated subclass.
        final isLoading = state is TopicStarting;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Predefined Topics',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ..._kPredefinedTopics.map(
                (topic) => TopicListTile(
                  topic: topic,
                  isSelected: selectedTopic == topic,
                  onTap: () => context
                      .read<TopicBloc>()
                      .add(TopicEvent.topicSelected(topic)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Custom Topic',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const CustomTopicField(),
              const Spacer(),
              FilledButton(
                onPressed: isStartEnabled && !isLoading
                    ? () => context
                        .read<TopicBloc>()
                        .add(const TopicEvent.sessionStartRequested())
                    : null,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Start Session'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
