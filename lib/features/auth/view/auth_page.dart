import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/auth/view/auth_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthView();
  }
}
