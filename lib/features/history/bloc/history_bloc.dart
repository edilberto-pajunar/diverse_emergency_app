import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/history.dart';
import 'package:emergency_test/repository/history_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _historyRepository;

  HistoryBloc({
    required HistoryRepository historyRepository,
  })  : _historyRepository = historyRepository,
        super(const HistoryState()) {
    on<HistoryInitRequested>(_onInitRequested);
  }

  void _onInitRequested(
    HistoryInitRequested event,
    Emitter<HistoryState> emit,
  ) async {
    final String? token = LocalRepository.getString("token");

    if (token == null) return;

    try {
      emit(state.copyWith(
        status: HistoryStatus.loading,
      ));
      final histories = await _historyRepository.getHistories(token);
      emit(state.copyWith(
        histories: histories,
        status: HistoryStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HistoryStatus.failed,
        error: e.toString(),
      ));
    }
  }
}
