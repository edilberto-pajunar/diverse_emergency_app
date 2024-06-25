// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      countryCode: json['country_code'] as String?,
      totalCredit: (json['total_credit'] as num?)?.toInt(),
      googleid: json['googleid'],
      subscribedYoutube: (json['subscribed_youtube'] as num?)?.toInt(),
      kycVerified: (json['kyc_verified'] as num?)?.toInt(),
      uname: json['uname'] as String?,
      totalPrimary: json['total_primary'] as String?,
      profilePic: json['profile_pic'] as String?,
      fullname: json['fullname'] as String?,
      location: json['location'] as String?,
      memberSince: json['member_since'] as String?,
      totalResponse: json['total_response'] as String?,
      totalReceived: json['total_received'] as String?,
      resultPercentage: (json['result_percentage'] as num?)?.toInt(),
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      memberId: json['member_id'] as String?,
      visitorId: json['visitor_id'] as String?,
      birthday: json['birthday'] as String?,
      lvl: json['lvl'] as String?,
      gender: json['gender'] as String?,
      totalTag: json['total_tag'] as String?,
      totalTagBy: json['total_tag_by'] as String?,
      currentLocationStatus: json['current_location_status'] as String?,
      currentPinnedLocation: json['current_pinned_location'],
      totalSentEmergency: json['total_sent_emergency'] as String?,
      totalSentResponsePts: json['total_sent_response_pts'] as String?,
      sentResponseRate: (json['sent_response_rate'] as num?)?.toInt(),
      viberConnected: (json['viber_connected'] as num?)?.toInt(),
      mobileActive: (json['mobile_active'] as num?)?.toInt(),
      inviteLink: json['invite_link'] as String?,
      verified: intToBool((json['verified'] as num).toInt()),
      mVerified: intToBool((json['m_verified'] as num).toInt()),
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'total_credit': instance.totalCredit,
      'googleid': instance.googleid,
      'subscribed_youtube': instance.subscribedYoutube,
      'kyc_verified': instance.kycVerified,
      'uname': instance.uname,
      'total_primary': instance.totalPrimary,
      'profile_pic': instance.profilePic,
      'fullname': instance.fullname,
      'location': instance.location,
      'member_since': instance.memberSince,
      'total_response': instance.totalResponse,
      'total_received': instance.totalReceived,
      'result_percentage': instance.resultPercentage,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'member_id': instance.memberId,
      'visitor_id': instance.visitorId,
      'birthday': instance.birthday,
      'lvl': instance.lvl,
      'gender': instance.gender,
      'total_tag': instance.totalTag,
      'total_tag_by': instance.totalTagBy,
      'current_location_status': instance.currentLocationStatus,
      'current_pinned_location': instance.currentPinnedLocation,
      'total_sent_emergency': instance.totalSentEmergency,
      'total_sent_response_pts': instance.totalSentResponsePts,
      'sent_response_rate': instance.sentResponseRate,
      'viber_connected': instance.viberConnected,
      'mobile_active': instance.mobileActive,
      'invite_link': instance.inviteLink,
      'verified': boolToInt(instance.verified),
      'm_verified': boolToInt(instance.mVerified),
    };