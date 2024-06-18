// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserInfo _$AppUserInfoFromJson(Map<String, dynamic> json) => AppUserInfo(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      activationCode: (json['activationCode'] as num?)?.toInt(),
      activatedAt: json['activatedAt'] == null
          ? null
          : DateTime.parse(json['activatedAt'] as String),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String? ?? "",
      birthday: DateTime.parse(json['birthday'] as String),
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$AppUserInfoToJson(AppUserInfo instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'birthday': instance.birthday.toIso8601String(),
      'gender': instance.gender,
      'activationCode': instance.activationCode,
      'activatedAt': instance.activatedAt?.toIso8601String(),
    };
