import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_event.freezed.dart';

@freezed
sealed class ProgressEvent with _$ProgressEvent {
  const factory ProgressEvent.statsLoaded() = StatsLoaded;
}
