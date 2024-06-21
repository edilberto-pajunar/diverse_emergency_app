import 'package:emergency_test/features/invitation/bloc/invitation_bloc.dart';
import 'package:emergency_test/features/invitation/view/invitation_view.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvitationPage extends StatelessWidget {
  static String route = "invitation_page_route";
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvitationBloc(
        activityRepository: context.read<ActivityRepository>(),
      ),
      child: const InvitationView(),
    );
  }
}
