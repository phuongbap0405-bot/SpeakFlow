import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event.freezed.dart';

@freezed
sealed class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.loadHistory() = LoadHistory;
  const factory HistoryEvent.sessionSelected(String id) = SessionSelected;
}
