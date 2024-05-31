import 'package:emergency_test/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  bool showLogin = true;

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
                      Image.network(
                        "https://i.pinimg.com/564x/26/61/94/2661948d8f8c6481daa358d0cdc96802.jpg",
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 12.0),
                      Visibility(
                        visible: !showLogin,
                        child: TextField(
                          controller: username,
                          decoration: const InputDecoration(
                            hintText: "username",
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: "example@gmail.com",
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: password,
                        decoration: const InputDecoration(
                          hintText: "password",
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RichText(
                          text: TextSpan(
                            text: showLogin
                                ? "Don't have an account? "
                                : "Already has an account? ",
                            style: theme.textTheme.bodyMedium!.copyWith(),
                            children: [
                              TextSpan(
                                text: showLogin ? "Sign up" : "Login",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      showLogin = !showLogin;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(showLogin
                              ? AuthEmailSignInAttempted(
                                  email: email.text, password: password.text)
                              : AuthCreateAccountAttempted(
                                  username: username.text,
                                  email: email.text,
                                  password: password.text,
                                ));
                        },
                        child: Text(showLogin ? "Log in" : "Sign up"),
                      ),
                      const SizedBox(height: 12.0),
                      const Text("OR"),
                      Visibility(
                        visible: showLogin,
                        child: Center(
                          child: TextButton(
                            onPressed: () => context
                                .read<AuthBloc>()
                                .add(AuthAnonymousSignInAttempted()),
                            child: const Text("Sign in anonymously"),
                          ),
                        ),
                      ),
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
