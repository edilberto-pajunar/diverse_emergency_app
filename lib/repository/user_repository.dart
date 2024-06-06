import 'dart:convert';

import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/models/app_user_info.dart';
import 'package:emergency_test/repository/database_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final DatabaseRepository databaseRepository;

  UserRepository({
    required this.databaseRepository,
  });

  Future<void> addIfNewUser({
    required AppUser user,
    required AppUserInfo userInfo,
  }) async {
    final userPath = "users/${user.id}";

    final userExists = await databaseRepository.docExists(path: userPath);
    if (userExists) return;

    await databaseRepository.setData(
      path: userPath,
      data: AppUserInfo.create(
        user: user,
        firstName: userInfo.firstName,
        lastName: userInfo.lastName,
        birthday: userInfo.birthday,
        gender: userInfo.gender,
      ).toJson(),
    );
  }

  Future<AppUserInfo> getUserInfo(AppUser user) async {
    final userPath = "users/${user.id}";

    AppUserInfo? userInfo = await databaseRepository.getData(
      path: userPath,
      builder: (data, _) => AppUserInfo.fromJson(data),
    );

    userInfo ??= await databaseRepository.getData(
      path: userPath,
      builder: (data, _) => AppUserInfo.fromJson(data),
    );
    return userInfo!;
  }

  Stream<AppUserInfo?> userInfoStream(String userId) {
    final userPath = "users/$userId";

    return databaseRepository.documentStream(
      path: userPath,
      builder: (data, _) => AppUserInfo.fromJson(data),
    );
  }

  Future<void> submitCode(String code, AppUserInfo user) async {
    if (user.activationCode.toString() == code) {
      await databaseRepository.setData(
        path: "users/${user.user.id}",
        data: user.copyWith(activatedAt: DateTime.now()).toJson(),
      );
    }
  }

  Future<void> sendActivationCode(String email) async {
    final uri = Uri.http("localhost", "/sendEmail");

    final body = {
      "emails": ["espajunarjr@gmail.com"],
      "subject": "Test",
      "body": "This is body"
    };

    await http.post(uri, body: jsonEncode(body));
  }
}
