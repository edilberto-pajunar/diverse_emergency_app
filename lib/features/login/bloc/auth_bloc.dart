import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
    required DatabaseRepository databaseRepository,
  })  : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthAnonymousSignInAttempted>(_onAnonymousSignInAttempted);
    on<AuthSignInFailed>(_onAuthSignInFailed);
    on<AuthEmailSignInAttempted>(_onEmailSignInAttempted);
    on<AuthCreateAccountAttempted>(_onCreateAccountAttempted);
  }

  void _onAnonymousSignInAttempted(
      AuthAnonymousSignInAttempted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loggingIn));
    try {
      await _authRepository.signInAnonymously();
      emit(state.copyWith(loginStatus: LoginStatus.loginSuccess));
    } catch (e) {
      add(AuthSignInFailed("$e"));
      rethrow;
    }
  }

  void _onEmailSignInAttempted(
    AuthEmailSignInAttempted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loggingIn));
      final userCreds = await _authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );

      if (userCreds == null) {
        return emit(state.copyWith(loginStatus: LoginStatus.cancelled));
      }

      emit(state.copyWith(loginStatus: LoginStatus.loginSuccess));
    } catch (e) {
      add(AuthSignInFailed("$e"));
      rethrow;
    }
  }

  void _onCreateAccountAttempted(
      AuthCreateAccountAttempted event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(createAccountStatus: CreateAccountStatus.creating));
      final userCred = await _authRepository.createAccount(
        event.email,
        event.password,
      );

      if (userCred.user == null) return;
    } catch (e) {
      add(AuthSignInFailed("$e"));
      rethrow;
    }
  }

  void _onAuthSignInFailed(AuthSignInFailed event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      loginStatus: LoginStatus.loginFailure,
      error: event.signInException,
    ));
  }
}
