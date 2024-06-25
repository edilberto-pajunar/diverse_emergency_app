import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/app/view/app_view.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:emergency_test/repository/history_repository.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class App extends StatefulWidget {
  const App({
    required this.activityRepository,
    required this.geolocationRepository,
    required this.placesRepository,
    required this.authRepository,
    required this.userRepository,
    required this.historyRepository,
    super.key,
  });

  final ActivityRepository activityRepository;
  final GeolocationRepository geolocationRepository;
  final PlaceRepository placesRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final HistoryRepository historyRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = AppBloc(
      geolocationRepository: widget.geolocationRepository,
      authRepository: widget.authRepository,
      userRepository: widget.userRepository,
    )..add(AppInitRequested());
    // );

    AppLifecycleListener(
      onStateChange: (state) {
        if (state == AppLifecycleState.resumed) {
          print("resume");
        }
      },
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.activityRepository),
        RepositoryProvider.value(value: widget.geolocationRepository),
        RepositoryProvider.value(value: widget.placesRepository),
        RepositoryProvider.value(value: widget.authRepository),
        RepositoryProvider.value(value: widget.userRepository),
        RepositoryProvider.value(value: widget.historyRepository)
      ],
      child: BlocProvider(
        create: (context) => appBloc,
        child: AppView(
          appBloc: appBloc,
        ),
      ),
    );
  }
}
