import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_view.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserActivitiesPage extends StatelessWidget {
  static String route = "user_actitvites_page_route";
  const UserActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserActivitiesBloc(
            userRepository: context.read<UserRepository>(),
          )..add(UserActivitiesInitRequested()),
        ),
      ],
      child: const UserActivitiesView(),
    );
  }
}
