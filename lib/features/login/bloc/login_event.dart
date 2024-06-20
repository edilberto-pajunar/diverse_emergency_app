part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailSignInAttempted extends LoginEvent {
  final String email;
  final String password;

  const LoginEmailSignInAttempted({
    required this.email,
    required this.password,
  });
}

final class LoginCreateAccountAttempted extends LoginEvent {
  final String username;
  final String email;
  final String password;

  const LoginCreateAccountAttempted({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class LoginSignInFailed extends LoginEvent {
  final String signInException;
  const LoginSignInFailed(this.signInException);
}
