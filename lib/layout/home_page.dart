import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emergency_test/app/app_router.gr.dart';
import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/user_info_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef TabWidgetRecord = ({Widget tabView, Widget tabBarItem});

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  final List<TabWidgetRecord> homeTabWidgetRecords = [
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      tabView: const UserActivitiesPage(),
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.map),
        label: "Map",
      ),
      tabView: const UserMapPage()
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
      tabView: const UserProfilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.currentUser == null) {
          context.replaceRoute(const AuthRoute());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppSignOutRequested()),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        drawer: const UserInfoDrawer(),
        body: homeTabWidgetRecords
            .map((tabRecord) => tabRecord.tabView)
            .toList()[tabIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: tabIndex,
          onDestinationSelected: (selectedIndex) {
            setState(() {
              tabIndex = selectedIndex;
            });
          },
          destinations: homeTabWidgetRecords
              .map((tabRecord) => tabRecord.tabBarItem)
              .toList(),
        ),
      ),
    );
  }
}
