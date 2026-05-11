import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_session_detail_use_case.dart';
import '../../domain/use_cases/get_sessions_use_case.dart';
import 'history_event.dart';
import 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetSessionsUseCase _getSessionsUseCase;
  final GetSessionDetailUseCase _getSessionDetailUseCase;

  HistoryBloc(
    this._getSessionsUseCase,
    this._getSessionDetailUseCase,
  ) : super(const HistoryState.loading()) {
    on<LoadHistory>(_onHistoryLoaded);
    on<SessionSelected>(_onSessionSelected);
  }

  Future<void> _onHistoryLoaded(
    LoadHistory event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryState.loading());
    final result = await _getSessionsUseCase();
    result.fold(
      (failure) => emit(HistoryState.error(failure.toString())),
      (sessions) => emit(HistoryState.loaded(sessions)),
    );
  }

  Future<void> _onSessionSelected(
    SessionSelected event,
    Emitter<HistoryState> emit,
  ) async {
    final result = await _getSessionDetailUseCase(sessionId: event.id);
    result.fold(
      (failure) => emit(HistoryState.error(failure.toString())),
      (session) => emit(HistoryState.detailLoaded(session)),
    );
  }
}
