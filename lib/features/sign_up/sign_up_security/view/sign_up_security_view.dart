import 'package:email_validator/email_validator.dart';
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
                  controller:
                      TextEditingController(text: state.countryCode ?? ""),
                  readOnly: true,
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("+63"),
                                  subtitle: const Text("Philippines"),
                                  onTap: () {
                                    context
                                      ..read<SignUpBloc>()
                                          .add(const SignUpSecuritySubmitted(
                                        countryCode: "63",
                                      ))
                                      ..pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  // onChanged: (val) {
                  //   context.read<SignUpBloc>().add(SignUpSecuritySubmitted(
                  //         countryCode: val,
                  //       ));
                  // },
                ),
                PrimaryTextField(
                  hintText: "Contact Number",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field is required";
                    } else if (val.length < 10) {
                      return "Please input a valid phone number.";
                    }
                    return null;
                  },
                  textInputType: TextInputType.number,
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
                    } else if (!EmailValidator.validate(val)) {
                      return "Please input a valid email.";
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
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "This field is required";
                    }

                    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
                    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
                    bool hasNumber = password.contains(RegExp(r'[0-9]'));
                    bool hasSpecialCharacter =
                        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

                    if (password.length < 6 ||
                        !hasLowercase ||
                        !hasUppercase ||
                        !hasNumber ||
                        !hasSpecialCharacter) {
                      return "Please input a valid password.";
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
                    if (val!.isEmpty) {
                      return "This field is required";
                    } else if (val != state.password) {
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
