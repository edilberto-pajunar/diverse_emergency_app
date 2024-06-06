import 'package:emergency_test/features/login/bloc/auth_bloc.dart';
import 'package:emergency_test/features/login/view/login_view.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static String route = "auth_page_route";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: context.read<AuthRepository>(),
        databaseRepository: context.read<DatabaseRepository>(),
      ),
      child: const LoginView(),
    );
  }
}
