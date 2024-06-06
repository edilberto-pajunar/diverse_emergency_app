part of 'auth_bloc.dart';

enum LoginStatus { idle, loggingIn, cancelled, loginSuccess, loginFailure }

enum CreateAccountStatus { idle, creating, cancelled, success, failure }

final class AuthState extends Equatable {
  final LoginStatus loginStatus;
  final CreateAccountStatus createAccountStatus;
  final String error;

  const AuthState({
    this.loginStatus = LoginStatus.idle,
    this.createAccountStatus = CreateAccountStatus.idle,
    this.error = "",
  });

  AuthState copyWith({
    LoginStatus? loginStatus,
    CreateAccountStatus? createAccountStatus,
    String? error,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      createAccountStatus: createAccountStatus ?? this.createAccountStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [loginStatus, createAccountStatus, error];
}
