import 'package:emergency_test/features/members/bloc/members_bloc.dart';
import 'package:emergency_test/models/member.dart';
import 'package:emergency_test/utils/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invite Through Members",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text:
                      "Search members via email address, fullname or username.",
                  children: [
                    TextSpan(
                      text: " Help?",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              BlocSelector<MembersBloc, MembersState, List<String>>(
                selector: (state) => state.fullName,
                builder: (context, fullName) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryTextField(
                        hintText: "Search member to tag",
                        onChanged: (val) {
                          context
                              .read<MembersBloc>()
                              .add(MembersSearchRequested(name: val));
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium,
                          text: "Search by",
                          children: [
                            TextSpan(
                              text: " Email Address",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fullName.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(fullName[index]),
                            trailing: TextButton(
                              child: const Text("Invite"),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
