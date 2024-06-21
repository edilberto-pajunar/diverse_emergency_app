part of 'invitation_bloc.dart';

final class InvitationEvent extends Equatable {
  const InvitationEvent();

  @override
  List<Object> get props => [];
}

final class InvitationTypeSubmitted extends InvitationEvent {
  final String type;

  const InvitationTypeSubmitted({
    required this.type,
  });
}

final class InvitationShareLinkRequested extends InvitationEvent {
  final String name;

  const InvitationShareLinkRequested({
    required this.name,
  });
}
