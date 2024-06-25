import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ExploreActivity extends StatelessWidget {
  const ExploreActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserActivitiesBloc, UserActivitiesState>(
      listener: (context, state) {
        if (state.emergencyStatus == EmergencyStatus.loading) {
          context.pop();
          Fluttertoast.showToast(msg: "Sending an emergency");
        }

        if (state.emergencyStatus == EmergencyStatus.success) {
          Fluttertoast.showToast(msg: state.emergencyResponse);
          context.read<AppBloc>().add(const AppHomeTabTapped(tab: 1));
        }
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          // onPressed: () => context
          //     .read<AppBloc>()
          //     .add(const AppHomeTabTapped(tab: 1)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog.adaptive(
                  title: const Text("Sending an emergency"),
                  content: const Text(
                    "Please confirm you want to send an emergency.",
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<UserActivitiesBloc>()
                              .add(UserExploreTapped(
                                location: context
                                    .read<AppBloc>()
                                    .state
                                    .currentLocation!,
                              ));
                        },
                        child: const Text("Send")),
                    TextButton(
                        onPressed: () => context.pop(),
                        child: const Text("Cancel")),
                  ],
                );
              },
            );
          },
          child: const Text("Explore"),
        ),
      ),
    );
  }
}
