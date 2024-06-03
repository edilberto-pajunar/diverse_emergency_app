import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class InvitationView extends StatelessWidget {
  const InvitationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    const shareImage =
        "https://plus.unsplash.com/premium_photo-1668051040456-24c63abd95b4?q=80&w=1876&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              shareImage,
              height: 300,
            ),
            const SizedBox(height: 12.0),
            Text(
              "Invite your loved ones",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Inviting someone will help you to track where you are and you can feel safe with them.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () => Share.share("check out my website "),
              label: const Text("Share your link"),
              icon: const Icon(Icons.share),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await Clipboard.setData(
                    const ClipboardData(text: "check out my website"));

                Fluttertoast.showToast(msg: "Copy to clibboard");
              },
              label: const Text("Copy your link"),
            ),
          ],
        ),
      ),
    );
  }
}
