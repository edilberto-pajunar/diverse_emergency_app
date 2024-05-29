part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitRequested extends AppEvent {}

class AppInitLocationStreamRequested extends AppEvent {}

class AppInitGoogleMapControllerStarted extends AppEvent {
  final GoogleMapController controller;

  const AppInitGoogleMapControllerStarted({
    required this.controller,
  });
}
