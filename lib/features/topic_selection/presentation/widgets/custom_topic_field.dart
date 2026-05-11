import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/topic_bloc.dart';
import '../bloc/topic_event.dart';
import '../bloc/topic_state.dart';

/// A text field for entering a custom conversation topic.
///
/// Enforces a 200-character maximum length and dispatches
/// [CustomTopicChanged] events to [TopicBloc] on every change.
/// Displays an inline validation error when the bloc state is [TopicInvalid].
class CustomTopicField extends StatefulWidget {
  const CustomTopicField({super.key});

  @override
  State<CustomTopicField> createState() => _CustomTopicFieldState();
}

class _CustomTopicFieldState extends State<CustomTopicField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicBloc, TopicState>(
      builder: (context, state) {
        // Show inline error only when the state is TopicInvalid and the
        // field has content (i.e. the user typed something invalid).
        // TopicInvalid is the freezed-generated subclass of TopicState.
        final errorText = (state is TopicInvalid &&
                _controller.text.isNotEmpty)
            ? state.error
            : null;

        return TextField(
          controller: _controller,
          maxLength: 200,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Or enter a custom topic',
            hintText: 'e.g. Traveling in Europe',
            errorText: errorText,
            border: const OutlineInputBorder(),
            counterText: '${_controller.text.length}/200',
          ),
          onChanged: (text) {
            // Rebuild to update the counter display.
            setState(() {});
            context
                .read<TopicBloc>()
                .add(TopicEvent.customTopicChanged(text));
          },
        );
      },
    );
  }
}
