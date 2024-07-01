import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/invitation/bloc/invitation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactView extends StatelessWidget {
  const AddContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<AppBloc>().add(const AppInitAuthRequested());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.phone_android_rounded,
                      size: 120.0,
                    ),
                    Text(
                      "In case of Emergency",
                      style: theme.textTheme.titleLarge,
                    ),
                    const Text("Please add your first Emergency Contact."),
                    const SizedBox(height: 12.0),
                    const Text(
                        "After confirmation by your 1st emergency contact, you will be allowed to add one (1) more contacts."),
                    const SizedBox(height: 12.0),
                    Text(
                      "Note: Sending invites outside your registered country via sms will require a top up. You may top up now here. For invitation, testing and sending of emergency notifications thru SMS, charges will be applied by your network provider. SOS does not make any changes.",
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(height: 24.0),
                    BlocSelector<AppBloc, AppState, String?>(
                      selector: (state) => state.member?.fullname,
                      builder: (context, name) {
                        return ElevatedButton(
                          onPressed: () => context.read<InvitationBloc>().add(
                              InvitationShareLinkRequested(name: name ?? "")),
                          child: const Text("INVITE NOW"),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AppBloc>()
                            .add(const AppInitAuthRequested());
                      },
                      child: const Text("RELOAD MANUALLY"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
