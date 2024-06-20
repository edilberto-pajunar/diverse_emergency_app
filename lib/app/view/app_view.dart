import 'package:emergency_test/app/app_router.dart';
import 'package:emergency_test/app/app_theme.dart';
import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  final AppBloc appBloc;

  const AppView({
    super.key,
    required this.appBloc,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final AppRouter appRouter = AppRouter(widget.appBloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      routerConfig: appRouter.config,
    );
  }
}
