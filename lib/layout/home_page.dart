import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/user_info_drawer.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/models/member.dart';
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
  int tabIndex = 1;

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
    return BlocSelector<AppBloc, AppState, Member?>(
      selector: (state) => state.member,
      builder: (context, state) {
        if (state == null) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AppBloc>().add(AppSignOutRequested());
                  },
                  icon: const Icon(
                    Icons.gps_fixed,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        }
        // return state.activatedAt == null
        return !state.verified!
            ? const ActivatePage()
            : Scaffold(
                appBar: AppBar(
                  actions: const [
                    // IconButton(
                    //   onPressed: () {
                    //     context.read<AppBloc>().add(AppSignOutRequested());
                    //   },
                    //   icon: const Icon(
                    //     Icons.gps_fixed,
                    //     color: Colors.blue,
                    //   ),
                    // ),
                  ],
                ),
                drawer: const UserInfoDrawer(),
                body: IndexedStack(
                  index: tabIndex,
                  children: homeTabWidgetRecords
                      .map((tabRecord) => tabRecord.tabView)
                      .toList(),
                ),
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
              );
      },
    );
  }
}
