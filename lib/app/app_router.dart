import 'dart:async';

import 'package:emergency_test/features/auth/view/auth_page.dart';
import 'package:emergency_test/features/invitation/view/invitation_page.dart';
import 'package:emergency_test/features/personal_info.dart/personal_info_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/home_page.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthRepository _authRepository;

  AppRouter(this._authRepository);

  late final GoRouter config = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        name: AuthPage.route,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: "/",
        name: HomePage.route,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: "activity",
            name: UserActivitiesPage.route,
            builder: (context, state) => const UserActivitiesPage(),
          ),
          GoRoute(
            path: "map",
            name: UserMapPage.route,
            builder: (context, state) => const UserMapPage(),
          ),
          GoRoute(
            path: "profile",
            name: UserProfilePage.route,
            builder: (context, state) => const UserProfilePage(),
            routes: [
              GoRoute(
                path: "personalInfo",
                name: PersonalInfoPage.route,
                builder: (context, state) => const PersonalInfoPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: "/invitation",
        name: InvitationPage.route,
        builder: (context, state) => const InvitationPage(),
      ),
    ],
    redirect: (context, state) async {
      final currentUser = await _authRepository.currentUserStream.first;
      final isLoggedIn = currentUser != null;

      final loggingIn = state.matchedLocation.startsWith("/login");

      if (!isLoggedIn) return loggingIn ? null : "/login";

      if (loggingIn) return "/";

      return null;
    },
    refreshListenable: _GoRouterRefreshStream(
      _authRepository.currentUserStream,
    ),
  );
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
