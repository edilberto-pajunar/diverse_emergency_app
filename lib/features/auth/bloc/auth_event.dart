part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthAnonymousSignInAttempted extends AuthEvent {}

final class AuthSignInFailed extends AuthEvent {
  final Exception signInException;
  const AuthSignInFailed(this.signInException);
}
