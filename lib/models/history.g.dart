// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      userInfo: AppUser.fromJson(json['userInfo'] as Map<String, dynamic>),
      currentLocation:
          AppLocation.fromJson(json['currentLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'userInfo': instance.userInfo,
      'currentLocation': instance.currentLocation,
    };
