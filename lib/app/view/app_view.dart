import 'package:emergency_test/app/app_router.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  final AppRouter appRouter;

  const AppView(this.appRouter, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
