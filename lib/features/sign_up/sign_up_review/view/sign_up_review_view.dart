import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpReviewView extends StatelessWidget {
  const SignUpReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBody(
        children: [
          Text(
            "Review Details",
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Make sure your personal information below is valid and correct. Please confirm to proceed, tap previous to update incorrect data. Thank you!",
          ),
          const SizedBox(height: 24.0),
          const Text("Name"),
          Text(
            "Edilberto Pajunar",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text("Birthday"),
          Text(
            "04 May 2001",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text("Gender"),
          Text(
            "Male",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text("Address"),
          Text(
            "Rodriguez, Rizal",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text("Mobile Number"),
          Text(
            "+639684059727",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Text("Email Address"),
          Text(
            "pajunar0@gmail.com",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
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
                    // context.pushNamed(SignUpReviewPage.route);
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
