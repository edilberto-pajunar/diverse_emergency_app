import 'package:emergency_test/features/members/bloc/members_bloc.dart';
import 'package:emergency_test/features/members/view/members_view.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersPage extends StatelessWidget {
  static String route = "members_page_route";
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembersBloc(
        activityRepository: context.read<ActivityRepository>(),
      ),
      child: const MembersView(),
    );
  }
}
