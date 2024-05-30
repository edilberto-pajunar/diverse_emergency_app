import 'package:auto_route/auto_route.dart';
import 'package:emergency_test/app/app_router.gr.dart';
import 'package:emergency_test/app/view/app_router_guard.dart';
import 'package:emergency_test/repository/auth_repository.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthRepository _authRepository;

  AppRouter(this._authRepository);

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(
        //   page: AuthRoute.page,
        // ),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          // guards: [
          //   AuthGuard(_authRepository),
          // ],
          children: [
            AutoRoute(
              page: UserActivitiesRoute.page,
            ),
            AutoRoute(
              page: UserMapRoute.page,
            ),
            AutoRoute(
              page: UserProfileRoute.page,
            ),
          ],
        ),
      ];
}
