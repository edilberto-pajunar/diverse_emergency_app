import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/sign_up/bloc/signup_bloc.dart';
import 'package:emergency_test/features/sign_up/widget/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpReviewView extends StatelessWidget {
  const SignUpReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          final name =
              "${state.firstName} ${state.middleName} ${state.lastName}";

          return LayoutBody(
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
                name,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text("Birthday"),
              Text(
                "${state.birthday}",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text("Gender"),
              Text(
                "${state.gender}",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text("Address"),
              Text(
                "${state.country}",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text("Mobile Number"),
              Text(
                "+${state.countryCode}${state.mobile}",
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
                      child: const Text("PREVIOUS"),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(ActivatePage.route);
                      },
                      child: const Text("CONFIRM"),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}