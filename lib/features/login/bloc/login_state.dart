part of 'login_bloc.dart';

enum LoginStatus { idle, loggingIn, cancelled, loginSuccess, loginFailure }

enum CreateAccountStatus { idle, creating, cancelled, success, failure }

final class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final CreateAccountStatus createAccountStatus;
  final String error;
  final AppUser? currentUserInfo;

  const LoginState({
    this.loginStatus = LoginStatus.idle,
    this.createAccountStatus = CreateAccountStatus.idle,
    this.error = "",
    this.currentUserInfo,
  });

  LoginState copyWith({
    LoginStatus? loginStatus,
    CreateAccountStatus? createAccountStatus,
    String? error,
    AppUser? currentUserInfo,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      createAccountStatus: createAccountStatus ?? this.createAccountStatus,
      error: error ?? this.error,
      currentUserInfo: currentUserInfo ?? this.currentUserInfo,
    );
  }

  @override
  List<Object?> get props => [
        loginStatus,
        createAccountStatus,
        error,
        currentUserInfo,
      ];
}
