import 'package:emergency_test/features/add_contact/view/add_contact_view.dart';
import 'package:emergency_test/features/invitation/bloc/invitation_bloc.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactPage extends StatelessWidget {
  static String route = "/add_contact_page_route";
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvitationBloc(
        activityRepository: context.read<ActivityRepository>(),
      ),
      child: const AddContactView(),
    );
  }
}
