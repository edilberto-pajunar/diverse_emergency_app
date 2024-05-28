import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/user_profile/bloc/user_profile_bloc.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileBloc(),
      child: const UserProfileView(),
    );
  }
}
