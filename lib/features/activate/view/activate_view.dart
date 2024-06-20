import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/bloc/activate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivateView extends StatelessWidget {
  const ActivateView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<ActivateBloc, ActivateState>(
        listener: (context, state) {
          if (state.sendEmailStatus == SendEmailStatus.success) {
            Fluttertoast.showToast(
                msg: "Email verification sent successfully!");
          }

          if (state.sendEmailStatus == SendEmailStatus.failed) {
            Fluttertoast.showToast(msg: "Failed to send email request");
          }
        },
        builder: (context, state) {
          final user = context.read<AppBloc>().state.member;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.contact_emergency,
                  size: 256,
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Hi, ${user?.fullname ?? ""}",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 12.0),
                const Text(
                  "Your created account is not fully activated. Email may take a while depending on your network connection. Check your spam folder or promotions folder if using gmail.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: ListTile(
                    title: Text(
                      "Verifying Email Address",
                      style: theme.textTheme.bodySmall,
                    ),
                    subtitle: Text(user?.email ?? ""),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Change"),
                    ),
                    leading: const Icon(Icons.close),
                  ),
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ActivateBloc>()
                        .add(ActivateSendEmailVerifRequest());
                  },
                  child: const Text("RESEND VERIFICATION"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppBloc>().add(const AppInitAuthRequested());
                  },
                  child: const Text("RELOAD MANUALLY"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
