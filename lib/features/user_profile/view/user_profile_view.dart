import 'package:emergency_test/features/user_profile/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              const ListTile(
                leading: CircleAvatar(),
                title: Text("User name"),
                subtitle: Text("User email"),
              ),
              const Divider(),
              const SizedBox(height: 12.0),
              Text(
                "Settings",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SettingTile(
                title: "Personal Information",
                icon: Icons.person_outline_sharp,
                onPressed: () {},
              ),
              SettingTile(
                title: "Login & Security",
                icon: Icons.security,
                onPressed: () {},
              ),
              SettingTile(
                title: "Accessibilty",
                icon: Icons.settings,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
