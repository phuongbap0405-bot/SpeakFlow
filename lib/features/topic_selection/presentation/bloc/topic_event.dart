import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_event.freezed.dart';

@freezed
sealed class TopicEvent with _$TopicEvent {
  const factory TopicEvent.topicSelected(String topic) = TopicSelected;
  const factory TopicEvent.customTopicChanged(String text) = CustomTopicChanged;
  const factory TopicEvent.sessionStartRequested() = SessionStartRequested;
}
