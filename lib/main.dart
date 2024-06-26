import 'package:bloc/bloc.dart';
import 'package:emergency_test/app/app_bloc_observer.dart';
import 'package:emergency_test/app/view/app.dart';
import 'package:emergency_test/firebase_options.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:emergency_test/repository/history_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:emergency_test/utils/version.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Version().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalRepository.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runAppIn();
}

void runAppIn() {
  Bloc.observer = AppBlocObserver();

  runApp(
    App(
      activityRepository: ActivityRepository(),
      authRepository: AuthRepository(firebaseAuth: FirebaseAuth.instance),
      historyRepository: HistoryRepository(),
      geolocationRepository: GeolocationRepository(),
      placesRepository: PlaceRepository(),
      userRepository: UserRepository(),
    ),
  );
}
