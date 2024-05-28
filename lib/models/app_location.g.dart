// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLocation _$AppLocationFromJson(Map<String, dynamic> json) => AppLocation(
      address: json['address'] as String?,
      location: _$recordConvert(
        json['location'],
        ($jsonValue) => (
          ($jsonValue[r'$1'] as num).toDouble(),
          ($jsonValue[r'$2'] as num).toDouble(),
        ),
      ),
    );

Map<String, dynamic> _$AppLocationToJson(AppLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'location': <String, dynamic>{
        r'$1': instance.location.$1,
        r'$2': instance.location.$2,
      },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
