import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/invitation/view/invitation_page.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/user_info_drawer.dart';
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
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.appAuthStatus == AppAuthStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final member = state.member!;

        if (!member.verified!) {
          return const ActivatePage();
        }

        if (double.parse(member.totalTag!) <= 0) {
          return const InvitationPage();
        }

        return Scaffold(
          appBar: AppBar(
            actions: const [],
          ),
          drawer: const UserInfoDrawer(),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<AppBloc>().add(AppInitRequested());
            },
            child: IndexedStack(
              index: tabIndex,
              children: homeTabWidgetRecords
                  .map((tabRecord) => tabRecord.tabView)
                  .toList(),
            ),
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
