import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../history/domain/entities/session.dart';

part 'topic_state.freezed.dart';

@freezed
sealed class TopicState with _$TopicState {
  const factory TopicState.initial() = TopicInitial;
  const factory TopicState.valid(String topic) = TopicValid;
  const factory TopicState.invalid(String error) = TopicInvalid;
  const factory TopicState.starting() = TopicStarting;
  const factory TopicState.started(Session session) = TopicStarted;
}
