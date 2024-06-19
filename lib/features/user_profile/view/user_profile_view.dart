import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/personal_info.dart/view/personal_info_page.dart';
import 'package:emergency_test/features/user_activities/widget/user_contact.dart';
import 'package:emergency_test/features/user_profile/widgets/setting_tile.dart';
import 'package:emergency_test/models/app_user_info.dart';
import 'package:emergency_test/utils/version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            BlocSelector<AppBloc, AppState, AppUserInfo?>(
              selector: (state) => state.currentUserInfo,
              builder: (context, userInfo) {
                return ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipOval(
                      child: Image.network(
                        UserContact.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Guest",
                  ),
                  subtitle: const Text("pajunar0@gmail.com"),
                );
              },
            ),
            const Divider(),
            Text(
              "Information",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "0",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Credit",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "0",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Tag"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "0",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Tag by"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "1",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Level"),
                  ],
                ),
              ],
            ),
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
