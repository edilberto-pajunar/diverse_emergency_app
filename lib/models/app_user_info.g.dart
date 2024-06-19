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
    );

Map<String, dynamic> _$AppUserInfoToJson(AppUserInfo instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'activationCode': instance.activationCode,
      'activatedAt': instance.activatedAt?.toIso8601String(),
    };
