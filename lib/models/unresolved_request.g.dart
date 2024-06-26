// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unresolved_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnresolvedRequest _$UnresolvedRequestFromJson(Map<String, dynamic> json) =>
    UnresolvedRequest(
      locationId: json['location_id'] as String?,
      requestName: json['request_name'] as String?,
      dtc: json['dtc'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UnresolvedRequestToJson(UnresolvedRequest instance) =>
    <String, dynamic>{
      'location_id': instance.locationId,
      'request_name': instance.requestName,
      'dtc': instance.dtc,
      'address': instance.address,
    };
