part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitRequested extends AppEvent {}

class AppInitLocationStreamRequested extends AppEvent {}

class AppInitAuthRequested extends AppEvent {
  const AppInitAuthRequested();
}

class AppSignOutRequested extends AppEvent {}

final class AppSignOutFailed extends AppEvent {
  final Exception signOutException;
  const AppSignOutFailed(this.signOutException);
}

final class AppHomeTabTapped extends AppEvent {
  final int tab;

  const AppHomeTabTapped({
    required this.tab,
  });
}

final class AppSessionTokenSubmitted extends AppEvent {
  const AppSessionTokenSubmitted();
}
