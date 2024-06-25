part of 'history_bloc.dart';

enum HistoryStatus { idle, loading, success, failed }

final class HistoryState extends Equatable {
  final List<History> histories;
  final HistoryStatus status;
  final String error;

  const HistoryState({
    this.histories = const [],
    this.status = HistoryStatus.idle,
    this.error = "",
  });

  HistoryState copyWith({
    List<History>? histories,
    HistoryStatus? status,
    String? error,
  }) {
    return HistoryState(
      histories: histories ?? this.histories,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        histories,
        status,
        error,
      ];
}
