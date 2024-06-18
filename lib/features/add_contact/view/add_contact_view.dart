import 'package:emergency_test/layout/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddContactView extends StatelessWidget {
  const AddContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.phone_android_rounded,
                size: 120.0,
              ),
              Text(
                "In case of Emergency",
                style: theme.textTheme.titleLarge,
              ),
              const Text("Please add your first Emergency Contact."),
              const SizedBox(height: 12.0),
              const Text(
                  "After confirmation by your 1st emergency contact, you will be allowed to add one (1) more contacts."),
              const SizedBox(height: 12.0),
              Text(
                "Note: Sending invites outside your registered country via sms will require a top up. You may top up now here. For invitation, testing and sending of emergency notifications thru SMS, charges will be applied by your network provider. SOS does not make any changes.",
                style: theme.textTheme.labelSmall,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => context.pushReplacementNamed(HomePage.route),
                child: const Text("INVITE NOW"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
