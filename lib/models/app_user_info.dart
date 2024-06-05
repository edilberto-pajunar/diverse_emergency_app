import 'dart:math';

import 'package:emergency_test/models/app_user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUserInfo extends Equatable {
  final AppUser user;
  final String username;
  final int activationCode;
  final DateTime? activatedAt;

  const AppUserInfo({
    required this.user,
    required this.username,
    required this.activationCode,
    this.activatedAt,
  });

  @override
  List<Object?> get props => [user, username, activationCode, activatedAt];

  factory AppUserInfo.create({
    required AppUser user,
  }) {
    return AppUserInfo(
      user: user,
      username: "",
      activationCode: generateActivationCode(),
    );
  }

  static int generateActivationCode() {
    int minSixDigit = 100000; // Smallest 6-digit number
    int maxSixDigit = 999999; // Largest 6-digit number

    // minSixDigit <= activationCode <= maxSixDigit
    return Random().nextInt(maxSixDigit - minSixDigit) + minSixDigit;
  }

  AppUserInfo copyWith({
    AppUser? user,
    String? username,
    int? activationCode,
    DateTime? activatedAt,
  }) {
    return AppUserInfo(
      user: user ?? this.user,
      username: username ?? this.username,
      activationCode: activationCode ?? this.activationCode,
      activatedAt: activatedAt ?? this.activatedAt,
    );
  }

  factory AppUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserInfoToJson(this);
}
