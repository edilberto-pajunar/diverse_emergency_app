part of 'auth_bloc.dart';

enum LoginStatus { idle, loggingIn, cancelled, loginSuccess, loginFailure }

final class AuthState extends Equatable {
  final LoginStatus loginStatus;

  const AuthState({
    this.loginStatus = LoginStatus.idle,
  });

  AuthState copyWith({
    LoginStatus? loginStatus,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object> get props => [loginStatus];
}
