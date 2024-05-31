import 'package:bloc/bloc.dart';
import 'package:emergency_test/app/app_bloc_observer.dart';
import 'package:emergency_test/app/view/app.dart';
import 'package:emergency_test/firebase_options.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/database_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runAppIn();
}

void runAppIn() {
  Bloc.observer = AppBlocObserver();

  runApp(
    App(
      authRepository: AuthRepository(firebaseAuth: FirebaseAuth.instance),
      databaseRepository: DatabaseRepository(),
      geolocationRepository: GeolocationRepository(),
      placesRepository: PlaceRepository(),
      userRepository: UserRepository(databaseRepository: DatabaseRepository()),
    ),
  );
}
