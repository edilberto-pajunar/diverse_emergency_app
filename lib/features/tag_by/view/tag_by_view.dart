import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/tag_by/bloc/tag_by_bloc.dart';
import 'package:emergency_test/models/member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagByView extends StatelessWidget {
  const TagByView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who tagged me?",
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "List of persons who tagged me and whom I accepted that I will be notified in case they sends help and emergency.",
            ),
            BlocSelector<TagByBloc, TagByState, List<String>>(
              selector: (state) => state.tags,
              builder: (context, tags) {
                return tags.isEmpty
                    ? const Center(
                        child: Text("No tags available"),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          final tag = tags[index];
                          return ListTile(
                            title: Text(tag),
                          );
                        });
              },
            ),
          ],
        ),
      ),
    );
  }
}
