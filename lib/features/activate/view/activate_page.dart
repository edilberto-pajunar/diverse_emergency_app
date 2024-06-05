import 'package:emergency_test/features/activate/bloc/activate_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_view.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivatePage extends StatelessWidget {
  const ActivatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivateBloc(
        userRepository: context.read<UserRepository>(),
      ),
      child: const ActivateView(),
    );
  }
}
