import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/models/unresolved_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unresolved Requests"),
      ),
      body: BlocListener<UserActivitiesBloc, UserActivitiesState>(
        listenWhen: (prev, curr) => prev.resolveStatus != curr.resolveStatus,
        listener: (context, state) {
          if (state.resolveStatus == ResolveStatus.loading) {}

          if (state.resolveStatus == ResolveStatus.success) {
            Fluttertoast.showToast(msg: state.resolveResponse ?? "");
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocSelector<UserActivitiesBloc, UserActivitiesState,
                List<UnresolvedRequest>>(
              selector: (state) => state.unresolvedRequest,
              builder: (context, requests) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        request.requestName ?? "",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        request.address ?? "",
                      ),
                      subtitle: Text(
                        request.dtc ?? "",
                        style: theme.textTheme.labelSmall,
                      ),
                      trailing: TextButton(
                        child: const Text("Resolve"),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                    "Are you sure you want to resolve this request?",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                            ..read<UserActivitiesBloc>().add(
                                                UserActivitiesResolveRequested(
                                              locationId:
                                                  request.locationId ?? "",
                                            ))
                                            ..pop();
                                        },
                                        child: const Text("Confirm")),
                                    TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text("Cancel")),
                                  ],
                                );
                              });
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
