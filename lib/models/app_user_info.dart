import 'dart:math';

import 'package:emergency_test/models/app_user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUserInfo extends Equatable {
  final AppUser user;
  final String firstName;
  final String lastName;
  final String? middleName;
  final DateTime birthday;
  final String gender;
  final int? activationCode;
  final DateTime? activatedAt;

  const AppUserInfo({
    required this.user,
    this.activationCode,
    this.activatedAt,
    required this.firstName,
    required this.lastName,
    this.middleName = "",
    required this.birthday,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        user,
        firstName,
        lastName,
        middleName,
        birthday,
        gender,
        activationCode,
        activatedAt,
      ];

  factory AppUserInfo.create({
    required AppUser user,
    required String firstName,
    required String lastName,
    String? middleName,
    required DateTime birthday,
    required String gender,
  }) {
    return AppUserInfo(
      user: user,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      birthday: birthday,
      gender: gender,
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
    String? firstName,
    String? lastName,
    String? middleName,
    DateTime? birthday,
    String? gender,
    int? activationCode,
    DateTime? activatedAt,
  }) {
    return AppUserInfo(
      user: user ?? this.user,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      activationCode: activationCode ?? this.activationCode,
      activatedAt: activatedAt ?? this.activatedAt,
    );
  }

  factory AppUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserInfoToJson(this);
}
