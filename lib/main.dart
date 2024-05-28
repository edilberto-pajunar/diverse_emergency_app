import 'package:bloc/bloc.dart';
import 'package:emergency_test/app/app_bloc_observer.dart';
import 'package:emergency_test/app/view/app.dart';
import 'package:flutter/material.dart';

void main() async {
  runAppIn();
}

void runAppIn() {
  if (true) {
    Bloc.observer = AppBlocObserver();
  }

  runApp(const App());
}
