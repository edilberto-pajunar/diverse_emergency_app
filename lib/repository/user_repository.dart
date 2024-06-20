import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/repository/database_repository.dart';

class UserRepository {
  final DatabaseRepository databaseRepository;

  UserRepository({
    required this.databaseRepository,
  });

  // Future<AppUserInfo> getUserInfo(AppUser user) async {
  //   final userPath = "users/${user.id}";

  //   AppUserInfo? userInfo = await databaseRepository.getData(
  //     path: userPath,
  //     builder: (data, _) => AppUserInfo.fromJson(data),
  //   );

  //   userInfo ??= await databaseRepository.getData(
  //     path: userPath,
  //     builder: (data, _) => AppUserInfo.fromJson(data),
  //   );
  //   return userInfo!;
  // }

  // Stream<AppUserInfo?> userInfoStream(String userId) {
  //   final userPath = "users/$userId";

  //   return databaseRepository.documentStream(
  //     path: userPath,
  //     builder: (data, _) => AppUserInfo.fromJson(data),
  //   );
  // }
}
