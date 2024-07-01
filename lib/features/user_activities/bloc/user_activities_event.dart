part of 'user_activities_bloc.dart';

class UserActivitiesEvent extends Equatable {
  const UserActivitiesEvent();

  @override
  List<Object> get props => [];
}

final class UserActivitiesInitRequested extends UserActivitiesEvent {}

final class UserActivitiesInitContactsRequested extends UserActivitiesEvent {}

final class UserActivitiesContactTypeTapped extends UserActivitiesEvent {
  final ContactType contactType;

  const UserActivitiesContactTypeTapped({
    required this.contactType,
  });
}

final class UserActivitiesExploreTapped extends UserActivitiesEvent {
  final AppLocation location;

  const UserActivitiesExploreTapped({
    required this.location,
  });
}

final class UserActivitiesUnresolvedExploreRequested
    extends UserActivitiesEvent {}

final class UserActivitiesResolveRequested extends UserActivitiesEvent {
  final String? locationId;

  const UserActivitiesResolveRequested({
    this.locationId,
  });
}

final class UserActivitiesFailedTriggered extends UserActivitiesEvent {
  final String error;

  const UserActivitiesFailedTriggered({
    required this.error,
  });
}

final class UserActivitiesCountdownTriggered extends UserActivitiesEvent {
  const UserActivitiesCountdownTriggered();
}

final class UserActivitiesStartCountdownTriggered extends UserActivitiesEvent {
  const UserActivitiesStartCountdownTriggered();
}

final class UserActivitiesSendEmergencyRequested extends UserActivitiesEvent {
  final String message;
  final Explore explore;

  const UserActivitiesSendEmergencyRequested({
    required this.message,
    required this.explore,
  });
}
