import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/progress_stats.dart';

part 'progress_state.freezed.dart';

@freezed
sealed class ProgressState with _$ProgressState {
  const factory ProgressState.loading() = ProgressLoading;
  const factory ProgressState.loaded(ProgressStats stats) = ProgressLoaded;
  const factory ProgressState.error(String message) = ProgressError;
}
