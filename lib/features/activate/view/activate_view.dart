import 'package:emergency_test/features/add_contact/view/add_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivateView extends StatelessWidget {
  const ActivateView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Padding(
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
              "Hi, first",
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
                subtitle: const Text("pajunar0@gmail.com"),
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
                context.pushNamed(AddContactPage.route);
              },
              child: const Text("RESEND VERIFICATION"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("RELOAD MANUALLY"),
            ),
          ],
        ),
      ),
    );
  }
}
