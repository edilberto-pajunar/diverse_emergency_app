import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_personal_info/view/sign_up_personal_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPersonalInfoPage extends StatelessWidget {
  const SignUpPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SignUpBloc>(),
      child: const SignUpPersonalInfoView(),
    );
  }
}
