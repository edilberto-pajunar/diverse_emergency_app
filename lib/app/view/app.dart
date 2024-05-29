import 'package:emergency_test/app/app_router.dart';
import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/app/view/app_view.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class App extends StatefulWidget {
  const App({
    required this.geolocationRepository,
    required this.placesRepository,
    super.key,
  });

  final GeolocationRepository geolocationRepository;
  final PlaceRepository placesRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    AppLifecycleListener(
      onStateChange: (state) {
        if (state == AppLifecycleState.resumed) {
          print("resume");
        }
      },
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.geolocationRepository),
        RepositoryProvider.value(value: widget.placesRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          geolocationRepository: widget.geolocationRepository,
        )..add(AppInitRequested()),
        child: AppView(_appRouter),
      ),
    );
  }
}
