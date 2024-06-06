import 'package:emergency_test/features/sign_up/sign_up_review/view/sign_up_review_page.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpSecurityView extends StatefulWidget {
  const SignUpSecurityView({super.key});

  @override
  State<SignUpSecurityView> createState() => _SignUpSecurityViewState();
}

class _SignUpSecurityViewState extends State<SignUpSecurityView> {
  final TextEditingController countryCode = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBody(
        children: [
          Text(
            "Sign Up - Security",
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Use to access your account using  your email address."),
          const SizedBox(height: 24.0),
          PrimaryTextField(
            hintText: "Country Code",
            controller: countryCode,
          ),
          PrimaryTextField(
            hintText: "Contact Number",
            controller: contactNumber,
          ),
          PrimaryTextField(
            hintText: "Username",
            controller: username,
          ),
          PrimaryTextField(
            hintText: "Email Address",
            controller: emailAddress,
          ),
          PrimaryTextField(
            hintText: "Password",
            controller: password,
          ),
          PrimaryTextField(
            hintText: "Confirm Password",
            controller: confirmPassword,
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
                  child: const Text("CANCEL"),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(SignUpReviewPage.route);
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
