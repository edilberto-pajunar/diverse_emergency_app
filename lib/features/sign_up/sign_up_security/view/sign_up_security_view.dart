import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/sign_up_review/view/sign_up_review_page.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpSecurityView extends StatefulWidget {
  const SignUpSecurityView({super.key});

  @override
  State<SignUpSecurityView> createState() => _SignUpSecurityViewState();
}

class _SignUpSecurityViewState extends State<SignUpSecurityView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          print(state);
          return Form(
            key: formKey,
            child: LayoutBody(
              children: [
                Text(
                  "Sign Up - Security",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    "Use to access your account using  your email address."),
                const SizedBox(height: 24.0),
                PrimaryTextField(
                  hintText: "Country Code",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          countryCode: val,
                        ));
                  },
                  initialValue: state.countryCode,
                ),
                PrimaryTextField(
                  hintText: "Contact Number",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          contactNumber: val,
                        ));
                  },
                  initialValue: state.mobile,
                ),
                PrimaryTextField(
                  hintText: "Username",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          username: val,
                        ));
                  },
                  initialValue: state.username,
                ),
                PrimaryTextField(
                  hintText: "Email Address",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          emailAddress: val,
                        ));
                  },
                  initialValue: state.email,
                ),
                PrimaryTextField(
                  hintText: "Password",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          password: val,
                        ));
                  },
                  initialValue: state.password,
                  isPassword: true,
                ),
                PrimaryTextField(
                  hintText: "Confirm Password",
                  onChanged: (val) {
                    context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                          confirmPassword: val,
                        ));
                  },
                  isPassword: true,
                  validator: (val) {
                    if (val != state.password) {
                      return "Password does not match.";
                    }
                    return null;
                  },
                  initialValue: state.confirmPassword,
                ),
                const SizedBox(height: 24.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: "By proceeding I agree to the "),
                      TextSpan(
                        text: "Terms and Conditions ",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const TextSpan(text: "and "),
                      TextSpan(
                        text: "Privacy Policy ",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const TextSpan(text: "of App name"),
                    ],
                  ),
                ),
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
                          if (formKey.currentState!.validate()) {
                            context.pushNamed(SignUpReviewPage.route, extra: {
                              "signUpBloc": context.read<SignUpBloc>(),
                            });
                          }
                        },
                        child: const Text("NEXT"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
