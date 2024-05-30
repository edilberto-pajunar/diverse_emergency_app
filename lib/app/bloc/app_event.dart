part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitRequested extends AppEvent {}

class AppInitLocationStreamRequested extends AppEvent {}

class AppInitAuthStreamRequested extends AppEvent {}

class AppSignOutRequested extends AppEvent {}

final class AppSignOutFailed extends AppEvent {
  final Exception signOutException;
  const AppSignOutFailed(this.signOutException);
}
