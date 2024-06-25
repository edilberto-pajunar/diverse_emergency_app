// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      fullname: json['fullname'] as String?,
      proPic: json['pro_pic'] as String?,
      notifRowId: json['notif_row_id'] as String?,
      markasread: (json['markasread'] as num?)?.toInt(),
      messageNotif: json['message_notif'] as String?,
      notifType: json['notif_type'] as String?,
      dataType: json['data_type'] == null
          ? null
          : DataType.fromJson(json['data_type'] as Map<String, dynamic>),
      datetime: json['datetime'] as String?,
      review: json['review'],
      emergencyLocation: json['emergency_location'] as String?,
      resolved: intToBool((json['resolved'] as num).toInt()),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'pro_pic': instance.proPic,
      'notif_row_id': instance.notifRowId,
      'markasread': instance.markasread,
      'message_notif': instance.messageNotif,
      'notif_type': instance.notifType,
      'data_type': instance.dataType,
      'datetime': instance.datetime,
      'review': instance.review,
      'emergency_location': instance.emergencyLocation,
      'resolved': boolToInt(instance.resolved),
    };

DataType _$DataTypeFromJson(Map<String, dynamic> json) => DataType(
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      dateRequest: json['date_request'] == null
          ? null
          : DateTime.parse(json['date_request'] as String),
    );

Map<String, dynamic> _$DataTypeToJson(DataType instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'date_request': instance.dateRequest?.toIso8601String(),
    };
