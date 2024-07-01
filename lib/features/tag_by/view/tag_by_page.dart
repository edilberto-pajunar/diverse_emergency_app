import 'package:emergency_test/features/tag_by/bloc/tag_by_bloc.dart';
import 'package:emergency_test/features/tag_by/view/tag_by_view.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagByPage extends StatelessWidget {
  static String route = "tag_by_page_route";
  const TagByPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagByBloc(
        activityRepository: context.read<ActivityRepository>(),
      )..add(TagByInitRequested()),
      child: const TagByView(),
    );
  }
}
