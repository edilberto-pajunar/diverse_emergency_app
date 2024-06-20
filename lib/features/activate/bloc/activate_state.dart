part of 'activate_bloc.dart';

enum SendEmailStatus { idle, loading, success, failed }

final class ActivateState extends Equatable {
  final SendEmailStatus sendEmailStatus;
  final String? error;

  const ActivateState({
    this.sendEmailStatus = SendEmailStatus.idle,
    this.error = "",
  });

  ActivateState copyWith({
    SendEmailStatus? sendEmailStatus,
    String? error,
  }) {
    return ActivateState(
      sendEmailStatus: sendEmailStatus ?? this.sendEmailStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [sendEmailStatus, error];
}
