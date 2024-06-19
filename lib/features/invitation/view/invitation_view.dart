import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';

class InvitationView extends StatelessWidget {
  const InvitationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final List<String> type = [
      "Acquaintance",
      "Aunt",
      "Brother",
      "Child",
      "Close friend",
      "Co-Worker",
      "Cousing",
      "Doctor"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Invite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Invites",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
                "Make sure to invite only a person who knows you and close to you."),
            Text(
              "e.g. family ,relatives, husband, wife, your children, close friends, co-workers, attending physician, etc.",
              style: theme.textTheme.labelSmall,
            ),
            const SizedBox(height: 24.0),
            PrimaryTextField(
              hintText: "Select Relationship",
              readOnly: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("Family"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12.0),
            const Text(
                "Note: Sending invites outside your registered country via sms will require a top up. You may top up now here."),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "INVITE NOW",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
