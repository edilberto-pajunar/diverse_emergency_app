import 'package:emergency_test/features/personal_info.dart/personal_info_page.dart';
import 'package:emergency_test/features/user_profile/widgets/setting_tile.dart';
import 'package:emergency_test/utils/asset.dart';
import 'package:emergency_test/utils/version.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final version = Version().packageInfo!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              onPressed: () => context.pushNamed(PersonalInfoPage.route),
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
            const Spacer(),
            Text(
              "v.${version.version}+${version.buildNumber}",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
