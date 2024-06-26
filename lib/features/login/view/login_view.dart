import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/login/bloc/login_bloc.dart';
import 'package:emergency_test/features/sign_up/view/sign_up_page.dart';
import 'package:emergency_test/layout/home_page.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.loginFailure ||
              state.createAccountStatus == CreateAccountStatus.failure) {
            Fluttertoast.showToast(msg: state.error);
          }

          if (state.loginStatus == LoginStatus.loginSuccess) {
            Fluttertoast.showToast(msg: "Login successfully");
            context
              ..read<AppBloc>().add(const AppInitAuthRequested())
              ..go("/");
          }
        },
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraint) {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
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
                          PrimaryTextField(
                            controller: email,
                            hintText: "email@gmail.com",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12.0),
                          PrimaryTextField(
                            controller: password,
                            hintText: "Password",
                            isPassword: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
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
                                      ..onTap = () =>
                                          context.goNamed(SignUpPage.route),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          BlocSelector<LoginBloc, LoginState, LoginStatus>(
                            selector: (state) => state.loginStatus,
                            builder: (context, status) {
                              return status == LoginStatus.loggingIn
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<LoginBloc>()
                                              .add(LoginEmailSignInAttempted(
                                                email: email.text,
                                                password: password.text,
                                              ));
                                        }
                                      },
                                      child: const Text("Log in"),
                                    );
                            },
                          ),
                          const SizedBox(height: 12.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
