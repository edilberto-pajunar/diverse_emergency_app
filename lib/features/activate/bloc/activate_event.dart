part of 'activate_bloc.dart';

sealed class ActivateEvent extends Equatable {
  const ActivateEvent();

  @override
  List<Object> get props => [];
}

class ActivateCodeSubmitted extends ActivateEvent {
  final String code;
  final AppUserInfo user;

  const ActivateCodeSubmitted({
    required this.code,
    required this.user,
  });
}

class ActivateResendCodeRequested extends ActivateEvent {}
