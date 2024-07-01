// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Explore _$ExploreFromJson(Map<String, dynamic> json) => Explore(
      the0: json['0'] as String?,
      the1: json['1'],
      result: (json['result'] as num?)?.toInt(),
      message: json['message'] as String?,
      firebaseReturnId: json['firebase_return_id'],
      testRequest: json['test_request'],
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      link: json['link'] as String?,
      linkMessage: json['link_message'] as String?,
      listMemberMobileTagged: (json['list_member_mobile_tagged']
              as List<dynamic>?)
          ?.map(
              (e) => ListMemberMobileTagged.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      nearbyCategory: json['nearby_category'] == null
          ? null
          : ExploreNearbyCategory.fromJson(
              json['nearby_category'] as Map<String, dynamic>),
      ernCode: json['ern_code'] as String?,
      mediaRestrict: (json['media_restrict'] as num?)?.toInt(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ExploreToJson(Explore instance) => <String, dynamic>{
      '0': instance.the0,
      '1': instance.the1,
      'result': instance.result,
      'message': instance.message,
      'firebase_return_id': instance.firebaseReturnId,
      'test_request': instance.testRequest,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'link': instance.link,
      'link_message': instance.linkMessage,
      'list_member_mobile_tagged': instance.listMemberMobileTagged,
      'id': instance.id,
      'nearby_category': instance.nearbyCategory,
      'ern_code': instance.ernCode,
      'media_restrict': instance.mediaRestrict,
      'address': instance.address,
    };

ListMemberMobileTagged _$ListMemberMobileTaggedFromJson(
        Map<String, dynamic> json) =>
    ListMemberMobileTagged(
      fullname: json['fullname'] as String?,
      mobile: json['mobile'] as String?,
      check: json['check'] as String?,
      linkMessage: json['link_message'] as String?,
    );

Map<String, dynamic> _$ListMemberMobileTaggedToJson(
        ListMemberMobileTagged instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'check': instance.check,
      'link_message': instance.linkMessage,
    };

ExploreNearbyCategory _$ExploreNearbyCategoryFromJson(
        Map<String, dynamic> json) =>
    ExploreNearbyCategory(
      nearbyCategory: (json['nearby_category'] as List<dynamic>?)
          ?.map(
              (e) => NearbyCategoryElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExploreNearbyCategoryToJson(
        ExploreNearbyCategory instance) =>
    <String, dynamic>{
      'nearby_category': instance.nearbyCategory,
    };

NearbyCategoryElement _$NearbyCategoryElementFromJson(
        Map<String, dynamic> json) =>
    NearbyCategoryElement(
      kycVerified: (json['kyc_verified'] as num?)?.toInt(),
      nearbyTitle: json['nearby_title'] as String?,
      query: json['query'] as String?,
      pinSrc: json['pin_src'] as String?,
      nearbyId: json['nearby_id'] as String?,
      active: json['active'] as String?,
      restrict: json['restrict'] as String?,
      nationalData: json['national_data'],
    );

Map<String, dynamic> _$NearbyCategoryElementToJson(
        NearbyCategoryElement instance) =>
    <String, dynamic>{
      'kyc_verified': instance.kycVerified,
      'nearby_title': instance.nearbyTitle,
      'query': instance.query,
      'pin_src': instance.pinSrc,
      'nearby_id': instance.nearbyId,
      'active': instance.active,
      'restrict': instance.restrict,
      'national_data': instance.nationalData,
    };
