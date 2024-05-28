import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserActivitiesPage extends StatelessWidget {
  const UserActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserActivitiesBloc(),
      child: const UserActivitiesView(),
    );
  }
}
