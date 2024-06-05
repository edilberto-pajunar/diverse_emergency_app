import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/bloc/activate_bloc.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivateView extends StatelessWidget {
  const ActivateView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Invitation Code"),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthRepository>().logOut,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: BlocSelector<ActivateBloc, ActivateState, ActivateStatus>(
        selector: (state) => state.status,
        builder: (context, state) {
          return (state == ActivateStatus.loading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Please invite someone before proceeding to the homepage",
                      ),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "XXXXXX",
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: () => context
                            .read<ActivateBloc>()
                            .add(ActivateCodeSubmitted(
                              code: controller.text,
                              user: context
                                  .read<AppBloc>()
                                  .state
                                  .currentUserInfo!,
                            )),
                        child: const Text("Submit"),
                      ),
                      const SizedBox(height: 12.0),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Resend"),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
