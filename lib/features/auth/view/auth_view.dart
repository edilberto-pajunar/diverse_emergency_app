import 'package:auto_route/auto_route.dart';
import 'package:emergency_test/app/app_router.gr.dart';
import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.currentUser != null) {
            context.replaceRoute(const HomeRoute());
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://i.pinimg.com/564x/26/61/94/2661948d8f8c6481daa358d0cdc96802.jpg",
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () => context
                    .read<AuthBloc>()
                    .add(AuthAnonymousSignInAttempted()),
                child: const Text("Sign in anonymously"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
