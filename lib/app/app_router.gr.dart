// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:emergency_test/features/auth/view/auth_page.dart' as _i1;
import 'package:emergency_test/features/user_activities/view/user_activities_page.dart'
    as _i3;
import 'package:emergency_test/features/user_map/view/user_map_page.dart'
    as _i4;
import 'package:emergency_test/features/user_profile/view/user_profile_page.dart'
    as _i5;
import 'package:emergency_test/layout/home_page.dart' as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    UserActivitiesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.UserActivitiesPage(),
      );
    },
    UserMapRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.UserMapPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.UserProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UserActivitiesPage]
class UserActivitiesRoute extends _i6.PageRouteInfo<void> {
  const UserActivitiesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserActivitiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserActivitiesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.UserMapPage]
class UserMapRoute extends _i6.PageRouteInfo<void> {
  const UserMapRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMapRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserProfilePage]
class UserProfileRoute extends _i6.PageRouteInfo<void> {
  const UserProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
