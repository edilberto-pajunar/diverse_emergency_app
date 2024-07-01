import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/add_contact/view/add_contact_page.dart';
import 'package:emergency_test/features/login/view/login_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/home_page.dart';
import 'package:emergency_test/layout/user_info_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

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
        if (state.appAuthStatus == AppAuthStatus.unauthenticated) {
          return const LoginPage();
        }

        if (state.appAuthStatus == AppAuthStatus.loading ||
            state.appLocationStatus == AppLocationStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.appAuthStatus == AppAuthStatus.authenticated) {
          if (!state.member!.verified!) {
            return const ActivatePage();
          }
          if (double.parse(state.member!.totalTag!) <= 0) {
            return const AddContactPage();
          }

          print(state.member!.verified);

          return PopScope(
            canPop: false,
            child: Scaffold(
              appBar: AppBar(
                actions: const [],
              ),
              drawer: const UserInfoDrawer(),
              body: RefreshIndicator(
                onRefresh: () async {
                  context.read<AppBloc>().add(AppInitRequested());
                },
                child: IndexedStack(
                  index: state.tabIndex,
                  children: homeTabWidgetRecords
                      .map((tabRecord) => tabRecord.tabView)
                      .toList(),
                ),
              ),
              bottomNavigationBar: NavigationBar(
                selectedIndex: state.tabIndex,
                onDestinationSelected: (selectedIndex) {
                  context.read<AppBloc>().add(AppHomeTabTapped(
                        tab: selectedIndex,
                      ));
                },
                destinations: homeTabWidgetRecords
                    .map((tabRecord) => tabRecord.tabBarItem)
                    .toList(),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
