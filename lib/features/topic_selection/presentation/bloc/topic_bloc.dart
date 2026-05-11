import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../conversation/domain/use_cases/start_session_use_case.dart';
import 'topic_event.dart';
import 'topic_state.dart';

@injectable
class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final StartSessionUseCase _startSessionUseCase;

  TopicBloc(this._startSessionUseCase) : super(const TopicState.initial()) {
    on<TopicSelected>(_onTopicSelected);
    on<CustomTopicChanged>(_onCustomTopicChanged);
    on<SessionStartRequested>(_onSessionStartRequested);
  }

  void _onTopicSelected(TopicSelected event, Emitter<TopicState> emit) {
    final trimmed = event.topic.trim();
    if (trimmed.isEmpty || trimmed.length > 200) {
      emit(const TopicState.invalid(
        'Topic must be between 1 and 200 characters.',
      ));
    } else {
      emit(TopicState.valid(trimmed));
    }
  }

  void _onCustomTopicChanged(
    CustomTopicChanged event,
    Emitter<TopicState> emit,
  ) {
    final text = event.text;
    if (text.isEmpty) {
      emit(const TopicState.initial());
    } else if (text.length <= 200) {
      emit(TopicState.valid(text));
    } else {
      emit(const TopicState.invalid(
        'Topic must be 200 characters or fewer.',
      ));
    }
  }

  Future<void> _onSessionStartRequested(
    SessionStartRequested event,
    Emitter<TopicState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TopicValid) return;

    final topic = currentState.topic;
    emit(const TopicState.starting());

    final result = _startSessionUseCase(topic: topic);
    result.fold(
      (failure) => emit(TopicState.invalid(failure.toString())),
      (session) => emit(TopicState.started(session)),
    );
  }
}
