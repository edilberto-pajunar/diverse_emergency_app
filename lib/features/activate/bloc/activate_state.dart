part of 'activate_bloc.dart';

enum ActivateStatus { idle, loading, success, failed }

final class ActivateState extends Equatable {
  final ActivateStatus status;

  const ActivateState({
    this.status = ActivateStatus.idle,
  });

  ActivateState copyWith({
    ActivateStatus? status,
  }) {
    return ActivateState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
