part of 'user_activities_bloc.dart';

sealed class UserActivitiesState extends Equatable {
  const UserActivitiesState();
  
  @override
  List<Object> get props => [];
}

final class UserActivitiesInitial extends UserActivitiesState {}
