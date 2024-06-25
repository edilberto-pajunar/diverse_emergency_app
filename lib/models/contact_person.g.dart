// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    ContactPerson(
      primarySet: (json['primary_set'] as num?)?.toInt(),
      smsReceiver: (json['sms_receiver'] as num?)?.toInt(),
      fullname: json['fullname'] as String?,
      tagStatus: (json['tag_status'] as num?)?.toInt(),
      dateApproved: json['date_approved'] == null
          ? null
          : DateTime.parse(json['date_approved'] as String),
      relationship: json['relationship'],
      memberId: json['member_id'] as String?,
      tagMemberId: json['tag_member_id'] as String?,
      rowId: json['row_id'] as String?,
      sharedLocationAllow: (json['shared_location_allow'] as num?)?.toInt(),
      proPic: json['pro_pic'] as String?,
      relationshipStatus: (json['relationship_status'] as num?)?.toInt(),
      sharedDeviceAllow: (json['shared_device_allow'] as num?)?.toInt(),
      receive: (json['receive'] as num?)?.toInt(),
      emailVerified: intToBool((json['email_verified'] as num).toInt()),
      mobileVerified: intToBool((json['mobile_verified'] as num).toInt()),
    );

Map<String, dynamic> _$ContactPersonToJson(ContactPerson instance) =>
    <String, dynamic>{
      'primary_set': instance.primarySet,
      'sms_receiver': instance.smsReceiver,
      'fullname': instance.fullname,
      'tag_status': instance.tagStatus,
      'date_approved': instance.dateApproved?.toIso8601String(),
      'relationship': instance.relationship,
      'member_id': instance.memberId,
      'tag_member_id': instance.tagMemberId,
      'row_id': instance.rowId,
      'shared_location_allow': instance.sharedLocationAllow,
      'pro_pic': instance.proPic,
      'relationship_status': instance.relationshipStatus,
      'shared_device_allow': instance.sharedDeviceAllow,
      'receive': instance.receive,
      'email_verified': boolToInt(instance.emailVerified),
      'mobile_verified': boolToInt(instance.mobileVerified),
    };
