import 'package:auto_route/auto_route.dart';
import 'package:emergency_test/app/app_router.gr.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/repository/auth_repository.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthRepository _authRepository;

  AuthGuard(this._authRepository);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    print('AuthGuard: Checking authentication state...');

    final AppUser? user = await _authRepository.currentUserStream.first;
    print("Auth Guard: Current user is ${user?.id}");

    if (user != null) {
      resolver.next(true);
    } else {
      router.push(const AuthRoute());
    }
  }
}
