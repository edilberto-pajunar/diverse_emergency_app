import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/auth/bloc/auth_bloc.dart';
import 'package:emergency_test/features/auth/view/auth_view.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  static String route = "auth_page_route";
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: context.read<AuthRepository>(),
        databaseRepository: context.read<DatabaseRepository>(),
      ),
      child: const AuthView(),
    );
  }
}
