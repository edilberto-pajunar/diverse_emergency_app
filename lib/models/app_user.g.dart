// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      result: intToBool((json['result'] as num).toInt()),
      message: json['message'] as String? ?? "",
      memberId: json['member_id'] as String? ?? "",
      fullName: json['fullname'] as String? ?? "",
      memberLevel: json['member_level'] as String? ?? "",
      profilePic: json['profile_pic'] as String? ?? "",
      verified: intToBool((json['verified'] as num).toInt()),
      fName: json['fName'] as String?,
      lName: json['lName'] as String?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'result': boolToInt(instance.result),
      'message': instance.message,
      'member_id': instance.memberId,
      'fullname': instance.fullName,
      'member_level': instance.memberLevel,
      'profile_pic': instance.profilePic,
      'verified': boolToInt(instance.verified),
      'fName': instance.fName,
      'lName': instance.lName,
    };
