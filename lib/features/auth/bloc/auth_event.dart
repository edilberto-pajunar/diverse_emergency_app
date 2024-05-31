part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthAnonymousSignInAttempted extends AuthEvent {}

final class AuthEmailSignInAttempted extends AuthEvent {
  final String email;
  final String password;

  const AuthEmailSignInAttempted({
    required this.email,
    required this.password,
  });
}

final class AuthCreateAccountAttempted extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const AuthCreateAccountAttempted({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class AuthSignInFailed extends AuthEvent {
  final String signInException;
  const AuthSignInFailed(this.signInException);
}
