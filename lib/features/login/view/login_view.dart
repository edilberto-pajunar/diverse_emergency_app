import 'package:emergency_test/features/login/bloc/auth_bloc.dart';
import 'package:emergency_test/features/sign_up/view/sign_up_page.dart';
import 'package:emergency_test/utils/asset.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.loginFailure ||
              state.createAccountStatus == CreateAccountStatus.failure) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight,
                minWidth: constraint.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        PngImage.logo,
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 12.0),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: "example@gmail.com",
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      PrimaryTextField(
                        controller: password,
                        hintText: "Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: theme.textTheme.bodyMedium!.copyWith(),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => context.goNamed(SignUpPage.route),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthEmailSignInAttempted(
                              email: email.text, password: password.text));
                        },
                        child: const Text("Log in"),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
