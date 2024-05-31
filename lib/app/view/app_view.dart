import 'package:emergency_test/app/app_router.dart';
import 'package:emergency_test/app/app_theme.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  final AppRouter _appRouter;

  const AppView(this._appRouter, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      routerConfig: _appRouter.config,
    );
  }
}
