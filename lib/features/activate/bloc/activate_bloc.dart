import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_user_info.dart';
import 'package:emergency_test/models/contact_person.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'activate_event.dart';
part 'activate_state.dart';

class ActivateBloc extends Bloc<ActivateEvent, ActivateState> {
  final UserRepository _userRepository;

  ActivateBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const ActivateState()) {
    on<ActivateCodeSubmitted>(_onCodeSubmitted);
    on<ActivateResendCodeRequested>(_onResendCodeRequested);
  }

  void _onCodeSubmitted(
    ActivateCodeSubmitted event,
    Emitter<ActivateState> emit,
  ) async {
    if (event.code.isEmpty ||
        event.code != event.user.activationCode.toString()) return;
    emit(state.copyWith(status: ActivateStatus.loading));

    try {
      await _userRepository.submitCode(event.code, event.user);

      emit(state.copyWith(status: ActivateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ActivateStatus.failed));
    }
  }

  void _onResendCodeRequested(
    ActivateResendCodeRequested event,
    Emitter<ActivateState> emit,
  ) {}
}
