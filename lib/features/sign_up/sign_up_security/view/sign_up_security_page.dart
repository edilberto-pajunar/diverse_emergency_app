import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_security/view/sign_up_security_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpSecurityPage extends StatelessWidget {
  static String route = "/security_page_route";
  const SignUpSecurityPage({
    required this.signUpBloc,
    super.key,
  });

  final SignUpBloc signUpBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: signUpBloc,
      child: const SignUpSecurityView(),
    );
  }
}
