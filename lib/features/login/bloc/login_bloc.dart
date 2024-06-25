import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginSignInFailed>(_onLoginSignInFailed);
    on<LoginEmailSignInAttempted>(_onEmailSignInAttempted);
    on<LoginCreateAccountAttempted>(_onCreateAccountAttempted);
  }

  void _onEmailSignInAttempted(
    LoginEmailSignInAttempted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loggingIn));
      final userCreds = await _authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );

      if (!userCreds.result) {
        throw userCreds.message!;
      }

      LocalRepository.setString("token", userCreds.memberId!);

      emit(state.copyWith(
        loginStatus: LoginStatus.loginSuccess,
        currentUserInfo: userCreds,
      ));
    } catch (e) {
      add(LoginSignInFailed("$e"));
    }
  }

  void _onCreateAccountAttempted(
      LoginCreateAccountAttempted event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(createAccountStatus: CreateAccountStatus.creating));
      final userCred = await _authRepository.createAccount(
        event.email,
        event.password,
      );

      if (userCred.user == null) return;
    } catch (e) {
      add(LoginSignInFailed("$e"));
      rethrow;
    }
  }

  void _onLoginSignInFailed(LoginSignInFailed event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      loginStatus: LoginStatus.loginFailure,
      error: event.signInException,
    ));
  }
}
