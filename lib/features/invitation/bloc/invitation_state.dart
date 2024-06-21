part of 'invitation_bloc.dart';

final class InvitationState extends Equatable {
  final String relationship;

  const InvitationState({
    this.relationship = "",
  });

  InvitationState copyWith({
    String? relationship,
  }) {
    return InvitationState(
      relationship: relationship ?? this.relationship,
    );
  }

  @override
  List<Object?> get props => [relationship];
}
