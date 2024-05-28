import 'package:auto_route/annotations.dart';
import 'package:emergency_test/features/map/map_page.dart';
import 'package:emergency_test/features/user_activities/user_activities_page.dart';
import 'package:emergency_test/features/user_profile/user_profile_page.dart';
import 'package:flutter/material.dart';

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
      tabView: const MapPage()
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
    return Scaffold(
      appBar: AppBar(),
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
  }
}
