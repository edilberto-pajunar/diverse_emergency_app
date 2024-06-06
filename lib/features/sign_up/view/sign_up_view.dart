import 'package:emergency_test/features/sign_up/sign_up_personal_info/view/sign_up_personal_info_page.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const SignUpPersonalInfoPage();
  }
}
