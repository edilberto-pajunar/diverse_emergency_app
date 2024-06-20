part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitRequested extends AppEvent {}

class AppInitLocationStreamRequested extends AppEvent {}

class AppInitAuthRequested extends AppEvent {
  final AppUser? currentUserInfo;

  const AppInitAuthRequested({
    this.currentUserInfo,
  });
}

class AppSignOutRequested extends AppEvent {}

final class AppSignOutFailed extends AppEvent {
  final Exception signOutException;
  const AppSignOutFailed(this.signOutException);
}
