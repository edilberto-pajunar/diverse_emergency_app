import 'package:emergency_test/features/activate/bloc/activate_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_view.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivatePage extends StatelessWidget {
  static String route = "/activate_page_route";
  const ActivatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivateBloc(
        authRepository: context.read<AuthRepository>(),
      )..add(ActivateSendEmailVerifRequest()),
      child: const ActivateView(),
    );
  }
}
