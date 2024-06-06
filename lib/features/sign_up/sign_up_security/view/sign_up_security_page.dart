import 'package:emergency_test/features/sign_up/sign_up_security/view/sign_up_security_view.dart';
import 'package:flutter/material.dart';

class SignUpSecurityPage extends StatelessWidget {
  static String route = "/security_page_route";
  const SignUpSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpSecurityView();
  }
}
