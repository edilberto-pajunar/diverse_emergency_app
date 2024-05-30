// To parse this JSON data, do
//
//     final nearbyPlace = nearbyPlaceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'nearby_place.g.dart';

NearbyPlace nearbyPlaceFromJson(String str) =>
    NearbyPlace.fromJson(json.decode(str));

String nearbyPlaceToJson(NearbyPlace data) => json.encode(data.toJson());

@JsonSerializable()
class NearbyPlace {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "formattedAddress")
  final String formattedAddress;
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "displayName")
  final DisplayName displayName;

  NearbyPlace({
    required this.id,
    required this.formattedAddress,
    required this.location,
    required this.rating,
    required this.displayName,
  });

  NearbyPlace copyWith({
    String? id,
    String? formattedAddress,
    Location? location,
    double? rating,
    DisplayName? displayName,
  }) =>
      NearbyPlace(
        id: id ?? this.id,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        displayName: displayName ?? this.displayName,
      );

  factory NearbyPlace.fromJson(Map<String, dynamic> json) =>
      _$NearbyPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyPlaceToJson(this);
}

@JsonSerializable()
class DisplayName {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "languageCode")
  final String languageCode;

  DisplayName({
    required this.text,
    required this.languageCode,
  });

  DisplayName copyWith({
    String? text,
    String? languageCode,
  }) =>
      DisplayName(
        text: text ?? this.text,
        languageCode: languageCode ?? this.languageCode,
      );

  factory DisplayName.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayNameToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
