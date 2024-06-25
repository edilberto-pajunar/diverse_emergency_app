import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/login/bloc/login_bloc.dart';
import 'package:emergency_test/features/login/view/login_view.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static String route = "auth_page_route";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        BlocProvider.value(
          value: context.read<AppBloc>(),
        ),
      ],
      child: const LoginView(),
    );
  }
}
