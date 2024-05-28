import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/route/auto_route_config.dart';
import 'package:emergency_test/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          path: "/${AuthRoute.name}",
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: "/",
          initial: true,
          children: [
            AutoRoute(
              page: UserActivitiesRoute.page,
              path: "activity",
            ),
            AutoRoute(
              page: UserMapRoute.page,
              path: "map",
            ),
            AutoRoute(
              page: UserProfileRoute.page,
              path: "profile",
            ),
          ],
        ),
      ];
}
