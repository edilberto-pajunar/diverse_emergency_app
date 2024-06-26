import 'dart:async';

import 'package:emergency_test/app/bloc/app_bloc.dart';
import 'package:emergency_test/features/activate/view/activate_page.dart';
import 'package:emergency_test/features/add_contact/view/add_contact_page.dart';
import 'package:emergency_test/features/login/view/login_page.dart';
import 'package:emergency_test/features/history/view/history_page.dart';
import 'package:emergency_test/features/invitation/view/invitation_page.dart';
import 'package:emergency_test/features/members/view/members_page.dart';
import 'package:emergency_test/features/personal_info.dart/view/personal_info_page.dart';
import 'package:emergency_test/features/request/view/request_page.dart';
import 'package:emergency_test/features/sign_up/sign_up_home_address/view/sign_up_home_address_page.dart';
import 'package:emergency_test/features/sign_up/sign_up_review/view/sign_up_review_page.dart';
import 'package:emergency_test/features/sign_up/sign_up_security/view/sign_up_security_page.dart';
import 'package:emergency_test/features/sign_up/view/sign_up_page.dart';
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart';
import 'package:emergency_test/features/user_map/view/user_map_page.dart';
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart';
import 'package:emergency_test/layout/home_page.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppBloc _appBloc;

  AppRouter(this._appBloc);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter config = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: "/login",
        name: LoginPage.route,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: "sign_up",
            name: SignUpPage.route,
            builder: (context, state) => const SignUpPage(),
          ),
          GoRoute(
            path: "home_address",
            name: SignUpHomeAddressPage.route,
            builder: (context, state) => SignUpHomeAddressPage(
              signUpBloc: (state.extra as Map)["signUpBloc"],
            ),
          ),
          GoRoute(
            path: "security",
            name: SignUpSecurityPage.route,
            builder: (context, state) => SignUpSecurityPage(
              signUpBloc: (state.extra as Map)["signUpBloc"],
            ),
          ),
          GoRoute(
            path: "review",
            name: SignUpReviewPage.route,
            builder: (context, state) => SignUpReviewPage(
              signUpBloc: (state.extra as Map)["signUpBloc"],
            ),
          ),
        ],
      ),
      GoRoute(
        path: "/check",
        name: "check",
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: "activate",
            name: ActivatePage.route,
            builder: (context, state) => const ActivatePage(),
          ),
          GoRoute(
            path: "add_contact",
            name: AddContactPage.route,
            builder: (context, state) => const AddContactPage(),
          ),
          GoRoute(
            path: "invitation",
            name: InvitationPage.route,
            builder: (context, state) => const InvitationPage(),
          ),
        ],
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
            routes: [
              GoRoute(
                path: "members",
                name: MembersPage.route,
                builder: (context, state) => const MembersPage(),
              ),
              GoRoute(
                path: "requests",
                name: RequestPage.route,
                builder: (context, state) => RequestPage(
                  userActivitiesBloc:
                      (state.extra as Map)["userActivitiesBloc"],
                ),
              ),
            ],
          ),
          GoRoute(
            path: "invitation",
            name: "invitation_root_page_route",
            builder: (context, state) => const InvitationPage(),
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

          // Drawer

          GoRoute(
            path: "history",
            name: HistoryPage.route,
            builder: (context, state) => const HistoryPage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final currentUser = LocalRepository.getString("token");
      print(state.matchedLocation);
      final isLoggedIn = currentUser != null;

      if (_appBloc.state.member != null) {
        final isVerified = _appBloc.state.member?.verified;
        final hasContact = double.parse(_appBloc.state.member!.totalTag!) > 0;

        if (!isVerified!) {
          return "/check/activate";
        }

        if (!hasContact) {
          return "/check/add_contact";
        }

        return null;
      }

      final loggingIn = state.matchedLocation.startsWith("/login");

      if (!isLoggedIn) return loggingIn ? null : "/login";

      if (loggingIn) return "/";

      return null;
    },
    // redirect: (context, state) async {
    //   final currentUser = _appBloc.state.appAuthStatus;

    //   final isLoggedIn = currentUser == AppAuthStatus.authenticated;

    //   final loggingIn = state.matchedLocation.startsWith("/login");

    //   print(loggingIn);

    //   if (!isLoggedIn) return loggingIn ? null : "/login";

    //   if (loggingIn) return "/";

    //   return null;
    // },
    refreshListenable: _GoRouterRefreshStream(_appBloc.stream),
  );
}

class _GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
