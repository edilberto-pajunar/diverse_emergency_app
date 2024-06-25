import 'package:emergency_test/features/history/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  // static final examples = [
  //   {
  //     "name": "Choi pajunar",
  //     "duration": "05/04/2001 00:00:00",
  //     "place": "Rodriguez Rizal, Philippines",
  //     "resolved": false,
  //   },
  //   {
  //     "name": "Test #2",
  //     "duration": "05/04/2001 00:00:00",
  //     "place": "Makati, Philippines",
  //     "resolved": true,
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SOS History"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  if (state.status == HistoryStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: state.histories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final history = state.histories[index];
                      return Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${history.fullname}",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${history.datetime}",
                                    style: theme.textTheme.labelSmall!.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                      "explore, near ${history.emergencyLocation}"),
                                ],
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              label:
                                  Text(history.resolved! ? "Resolved" : "View"),
                              icon: Icon(
                                history.resolved!
                                    ? Icons.thumb_up_alt
                                    : Icons.place,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
