import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/personal_info.dart/view/personal_info_page.dart';
import 'package:emergency_test/features/user_activities/widget/contact_activity.dart';
import 'package:emergency_test/features/user_profile/widgets/setting_tile.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/models/member.dart';
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
            BlocSelector<AppBloc, AppState, Member?>(
              selector: (state) => state.member,
              builder: (context, member) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 40,
                        child: ClipOval(
                          child: Image.network(
                            member?.profilePic ?? ContactActivity.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        "Name: ${member?.fullname}",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Email: ${member?.email}"),
                    ),
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
                              "${member?.totalCredit}",
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
                              "${member?.totalTag}",
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
                              "${member?.totalTagBy}",
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
                              "${member?.lvl}",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("Level"),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
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
