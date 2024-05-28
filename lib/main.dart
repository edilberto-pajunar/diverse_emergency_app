import 'package:bloc/bloc.dart';
import 'package:emergency_test/app/app_bloc_observer.dart';
import 'package:emergency_test/app/view/app.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runAppIn();
}

void runAppIn() {
  Bloc.observer = AppBlocObserver();

  runApp(App(
    geolocationRepository: GeolocationRepository(),
  ));
}
