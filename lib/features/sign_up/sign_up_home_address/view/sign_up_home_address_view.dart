import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_security/view/sign_up_security_page.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpHomeAddressView extends StatefulWidget {
  const SignUpHomeAddressView({super.key});

  @override
  State<SignUpHomeAddressView> createState() => _SignUpHomeAddressViewState();
}

class _SignUpHomeAddressViewState extends State<SignUpHomeAddressView> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBody(
        children: [
          Text(
            "Sign Up - Home Address",
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Some of the emergency features rely on your home address settings. Kindly make sure to specify your correct home address to avoid issues in the future.",
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state.address == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  PrimaryTextField(
                    hintText: "Country",
                    initialValue: state.country,
                  ),
                  PrimaryTextField(
                    hintText: "Address",
                    maxLines: 5,
                    initialValue: state.address,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24.0),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("PREVIOUS"),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(SignUpSecurityPage.route, extra: {
                      "signUpBloc": context.read<SignUpBloc>(),
                    });
                  },
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
