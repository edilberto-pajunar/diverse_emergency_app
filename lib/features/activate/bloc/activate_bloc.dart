import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';

part 'activate_event.dart';
part 'activate_state.dart';

class ActivateBloc extends Bloc<ActivateEvent, ActivateState> {
  final AuthRepository _authRepository;

  ActivateBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const ActivateState()) {
    on<ActivateSendEmailVerifRequest>(_onSendEmailVerifRequest);
  }

  void _onSendEmailVerifRequest(
    ActivateSendEmailVerifRequest event,
    Emitter<ActivateState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;

    try {
      emit(state.copyWith(sendEmailStatus: SendEmailStatus.loading));

      await _authRepository.sendEmailVerif(token);

      emit(state.copyWith(sendEmailStatus: SendEmailStatus.success));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        sendEmailStatus: SendEmailStatus.failed,
      ));
    }
  }
}
