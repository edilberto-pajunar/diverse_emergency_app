import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/invitation/view/invitation_page.dart';
import 'package:emergency_test/features/members/view/members_page.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/features/user_activities/widget/explore_activity.dart';
import 'package:emergency_test/features/user_activities/widget/contact_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserActivitiesView extends StatelessWidget {
  const UserActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserActivitiesBloc>().add(UserActivitiesInitRequested());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   "Current Location: ${state.currentLocation?.address}",
                          //   style: theme.textTheme.bodyMedium!.copyWith(),
                          // ),
                          const SizedBox(height: 12.0),
                          Text(
                            "Tap an icon in case of EMERGENCY",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          const ExploreActivity(),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TAG INVITE",
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 18.0,
                      child: IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 12.0),
                                    Text(
                                      "TAG LIST",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                        "This is all who accepted your invites go."),
                                    const SizedBox(height: 12.0),
                                    Text(
                                      "PRIMARY LIST",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "This is all your selected primary contacts go, base on your membership level requirement.",
                                    ),
                                    const SizedBox(height: 12.0),
                                    Text(
                                      "EMERGENCY NOTIFICATION",
                                      style:
                                          theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "By default first 3 50 200 of your Tag list will received notifications in case you sent an emergency, and will received sms notification as follows:",
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text("⚫ Level 1 - 3"),
                                    const Text("⚫ Level 2 - 5"),
                                    const Text("⚫ Level 3 - 10"),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      "In case you set primary contacts, all in your primary list will received an SOS app and email notification",
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      "In your primary list, you can set whom will received an sms notification",
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      "Note: You will be charged an sms fee by your mobile carrier network (TELCO) for each notification sent to your sms contacts in case of emergency.",
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.question_mark,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text("Connect, stay safe and watch each others back."),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionTag(
                      text: "Send Invites",
                      icon: Icons.contact_emergency,
                      onPressed: () {
                        context.pushNamed(InvitationPage.route);
                      },
                    ),
                    ActionTag(
                      text: "Members",
                      icon: Icons.card_membership,
                      onPressed: () => context.pushNamed(MembersPage.route),
                    ),
                    ActionTag(
                      text: "Who tagged me?",
                      icon: Icons.people,
                      onPressed: () {},
                    ),
                  ],
                ),
                const ContactActivity(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionTag extends StatelessWidget {
  const ActionTag({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String text;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          child: Icon(
            icon,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ],
    );
  }
}
