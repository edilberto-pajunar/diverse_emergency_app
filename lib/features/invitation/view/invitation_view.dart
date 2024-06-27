import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/invitation/bloc/invitation_bloc.dart';
import 'package:emergency_test/features/login/view/login_page.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

    final String? name = context.read<AppBloc>().state.member!.fullname;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Invite"),
        actions: [
          IconButton(
            onPressed: () {
              context
                ..read<AppBloc>().add(AppSignOutRequested())
                ..pushReplacementNamed(LoginPage.route);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: RefreshIndicator(
        displacement: 80.0,
        onRefresh: () async {
          context.read<AppBloc>().add(AppInitRequested());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
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
                BlocSelector<InvitationBloc, InvitationState, String?>(
                  selector: (state) => state.relationship,
                  builder: (context, relationship) {
                    return PrimaryTextField(
                      hintText: "Select Relationship",
                      readOnly: true,
                      controller: TextEditingController(text: relationship),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return SizedBox(
                              width: double.infinity,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: type.map((relationship) {
                                    return TextButton(
                                      onPressed: () {
                                        context
                                          ..read<InvitationBloc>()
                                              .add(InvitationTypeSubmitted(
                                            type: relationship,
                                          ))
                                          ..pop();
                                      },
                                      child: Text(relationship),
                                    );
                                  }).toList()),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 12.0),
                const Text(
                    "Note: Sending invites outside your registered country via sms will require a top up. You may top up now here."),
                const SizedBox(height: 24.0),
                BlocSelector<InvitationBloc, InvitationState, String?>(
                  selector: (state) => state.relationship,
                  builder: (context, relationship) {
                    return ElevatedButton(
                      onPressed: () {
                        context
                            .read<InvitationBloc>()
                            .add(InvitationShareLinkRequested(name: name!));
                      },
                      child: const Text(
                        "INVITE NOW",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
