import 'package:emergency_test/features/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String route = "/sign_up_page_route";
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}
