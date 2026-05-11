import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_progress_stats_use_case.dart';
import 'progress_event.dart';
import 'progress_state.dart';

@injectable
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final GetProgressStatsUseCase _getProgressStatsUseCase;

  ProgressBloc(this._getProgressStatsUseCase) : super(const ProgressState.loading()) {
    on<StatsLoaded>(_onStatsLoaded);
  }

  Future<void> _onStatsLoaded(
    StatsLoaded event,
    Emitter<ProgressState> emit,
  ) async {
    emit(const ProgressState.loading());
    final result = await _getProgressStatsUseCase();
    result.fold(
      (failure) => emit(ProgressState.error(failure.toString())),
      (stats) => emit(ProgressState.loaded(stats)),
    );
  }
}
