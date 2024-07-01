import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/add_contact/view/add_contact_page.dart';
import 'package:emergency_test/features/login/view/login_page.dart';
import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/home_view.dart';
import 'package:emergency_test/layout/user_info_drawer.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef TabWidgetRecord = ({Widget tabView, Widget tabBarItem});

class HomePage extends StatefulWidget {
  static String route = "home_page_route";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserActivitiesBloc(
            userRepository: context.read<UserRepository>(),
          ),
        ),
      ],
      child: HomeView(),
    );
  }
}
