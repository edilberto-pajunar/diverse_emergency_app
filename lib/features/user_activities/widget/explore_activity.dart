import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/request/view/request_page.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/models/unresolved_request.dart';
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
    final ThemeData theme = Theme.of(context);

    print(context.read<UserActivitiesBloc>().state.emergencyStatus);

    return Column(
      children: [
        BlocSelector<UserActivitiesBloc, UserActivitiesState,
            List<UnresolvedRequest>>(
          selector: (state) => state.unresolvedRequest,
          builder: (context, request) {
            return GestureDetector(
              onTap: () => context.pushNamed(RequestPage.route, extra: {
                "userActivitiesBloc": context.read<UserActivitiesBloc>(),
              }),
              child: Visibility(
                visible: request.isNotEmpty,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      "Unresolved Request",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "You have unresolved request listed, tap here to solve your request",
                      style: theme.textTheme.bodySmall,
                    ),
                    leading: const Icon(Icons.account_tree_rounded),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12.0),
        BlocListener<UserActivitiesBloc, UserActivitiesState>(
          listenWhen: (prev, curr) =>
              prev.emergencyStatus != curr.emergencyStatus,
          listener: (context, state) {
            if (state.emergencyStatus == EmergencyStatus.loading) {
              context.pop();
              Fluttertoast.showToast(msg: "Sending an emergency");
            }

            if (state.emergencyStatus == EmergencyStatus.success) {
              Fluttertoast.showToast(msg: state.emergencyResponse!.message!);
              context.read<AppBloc>().add(const AppHomeTabTapped(tab: 1));
              context.read<AppBloc>().add(AppInitRequested());
            }
            if (state.emergencyStatus == EmergencyStatus.failed) {
              Fluttertoast.showToast(msg: state.error ?? "");
            }
          },
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<UserActivitiesBloc>()
                    .add(const UserActivitiesCountdownTriggered());
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<UserActivitiesBloc>(),
                      child: AlertDialog.adaptive(
                        title: const Text("Sending an emergency"),
                        content: BlocSelector<UserActivitiesBloc,
                            UserActivitiesState, int?>(
                          selector: (state) => state.timer,
                          builder: (context, timer) {
                            // Build UI based on the current state
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("$timer"),
                                const SizedBox(height: 10),
                                const Text(
                                  "Please confirm you want to send an emergency.",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<UserActivitiesBloc>().add(
                                    UserActivitiesExploreTapped(
                                      location: context
                                          .read<AppBloc>()
                                          .state
                                          .currentLocation!,
                                    ),
                                  );
                            },
                            child: const Text("Send"),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                ..read<UserActivitiesBloc>().add(
                                    const UserActivitiesCountdownTriggered())
                                ..pop();
                            },
                            child: const Text("Cancel"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Explore"),
            ),
          ),
        ),
      ],
    );
  }
}
