part of 'user_activities_bloc.dart';

class UserActivitiesEvent extends Equatable {
  const UserActivitiesEvent();

  @override
  List<Object> get props => [];
}

final class UserContactTypeTapped extends UserActivitiesEvent {
  final ContactType contactType;

  const UserContactTypeTapped({
    required this.contactType,
  });
}

final class UserExploreTapped extends UserActivitiesEvent {
  final AppLocation location;

  const UserExploreTapped({
    required this.location,
  });
}
