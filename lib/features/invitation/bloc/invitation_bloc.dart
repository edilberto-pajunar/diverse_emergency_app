import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';

part 'invitation_event.dart';
part 'invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  final ActivityRepository _activityRepository;

  InvitationBloc({
    required ActivityRepository activityRepository,
  })  : _activityRepository = activityRepository,
        super(const InvitationState()) {
    on<InvitationTypeSubmitted>(_onTypeSubmitted);
    on<InvitationShareLinkRequested>(_onShareLinkRequested);
  }

  void _onTypeSubmitted(
    InvitationTypeSubmitted event,
    Emitter<InvitationState> emit,
  ) async {
    emit(state.copyWith(
      relationship: event.type,
    ));
  }

  void _onShareLinkRequested(
    InvitationShareLinkRequested event,
    Emitter<InvitationState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    final invitationToken =
        await _activityRepository.generateInvitationToken(token!);

    await Share.share(
      "Hi this ${event.name} and I'd like to connect with you, please accept my invitation link below to receive my emergency notification for every time I send help. https://wwwbeta.yusaeidbeta.com/SOS_EXPLORE/invite/?mid=$token&token=$invitationToken&rel=${state.relationship}",
    );
  }
}
