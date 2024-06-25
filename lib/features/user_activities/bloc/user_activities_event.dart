part of 'user_activities_bloc.dart';

class UserActivitiesEvent extends Equatable {
  const UserActivitiesEvent();

  @override
  List<Object> get props => [];
}

final class UserInitRequested extends UserActivitiesEvent {}

final class UserInitContactsRequested extends UserActivitiesEvent {
  
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
