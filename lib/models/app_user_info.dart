import 'dart:math';

import 'package:clock/clock.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUserInfo extends Equatable {
  final AppUser user;
  final String username;

  const AppUserInfo({
    required this.user,
    required this.username,
  });

  @override
  List<Object?> get props => [user, username];

  factory AppUserInfo.create({
    required AppUser user,
  }) {
    return AppUserInfo(
      user: user,
      username: "",
    );
  }

  factory AppUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserInfoToJson(this);
}
