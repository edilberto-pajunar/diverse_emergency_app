import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_review/view/sign_up_review_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpReviewPage extends StatelessWidget {
  static String route = "/review_page_route";
  const SignUpReviewPage({
    required this.signUpBloc,
    super.key,
  });

  final SignUpBloc signUpBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: signUpBloc,
      child: const SignUpReviewView(),
    );
  }
}
