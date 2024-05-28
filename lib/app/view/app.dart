import 'package:emergency_test/app/app_router.dart';
import 'package:emergency_test/app/view/app_view.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppView(_appRouter);
  }
}
