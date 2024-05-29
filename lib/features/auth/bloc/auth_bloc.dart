import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthAnonymousSignInAttempted>(_onAnonymousSignInAttempted);
    on<AuthSignInFailed>(_onAuthSignInFailed);
  }

  void _onAnonymousSignInAttempted(
      AuthAnonymousSignInAttempted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loggingIn));
    try {
      await _authRepository.signInAnonymously();
      emit(state.copyWith(loginStatus: LoginStatus.loginSuccess));
    } catch (e) {
      add(AuthSignInFailed(e as Exception));
      rethrow;
    }
  }

  void _onAuthSignInFailed(AuthSignInFailed event, Emitter<AuthState> emit) {
    emit(state.copyWith(loginStatus: LoginStatus.loginFailure));
  }
}
