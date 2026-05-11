import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/session.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = HistoryLoading;
  const factory HistoryState.loaded(List<Session> sessions) = HistoryLoaded;
  const factory HistoryState.detailLoaded(Session session) = SessionDetailLoaded;
  const factory HistoryState.error(String message) = HistoryError;
}
