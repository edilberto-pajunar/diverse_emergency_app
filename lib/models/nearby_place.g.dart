// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyPlace _$NearbyPlaceFromJson(Map<String, dynamic> json) => NearbyPlace(
      id: json['id'] as String,
      formattedAddress: json['formattedAddress'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      displayName:
          DisplayName.fromJson(json['displayName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearbyPlaceToJson(NearbyPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'formattedAddress': instance.formattedAddress,
      'location': instance.location,
      'rating': instance.rating,
      'displayName': instance.displayName,
    };

DisplayName _$DisplayNameFromJson(Map<String, dynamic> json) => DisplayName(
      text: json['text'] as String,
      languageCode: json['languageCode'] as String,
    );

Map<String, dynamic> _$DisplayNameToJson(DisplayName instance) =>
    <String, dynamic>{
      'text': instance.text,
      'languageCode': instance.languageCode,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
