import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'nearby_place.g.dart';

NearbyPlace nearbyPlaceFromJson(String str) =>
    NearbyPlace.fromJson(json.decode(str));

String nearbyPlaceToJson(NearbyPlace data) => json.encode(data.toJson());

@JsonSerializable()
class NearbyPlace {
  @JsonKey(name: "geometry")
  final Geometry geometry;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "icon_background_color")
  final String? iconBackgroundColor;
  @JsonKey(name: "icon_mask_base_uri")
  final String? iconMaskBaseUri;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "photos")
  final List<Photo>? photos;
  @JsonKey(name: "place_id")
  final String placeId;
  @JsonKey(name: "reference")
  final String? reference;
  @JsonKey(name: "scope")
  final String? scope;
  @JsonKey(name: "types")
  final List<String>? types;
  @JsonKey(name: "vicinity")
  final String? vicinity;

  NearbyPlace({
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    required this.photos,
    required this.placeId,
    required this.reference,
    required this.scope,
    required this.types,
    required this.vicinity,
  });

  NearbyPlace copyWith({
    Geometry? geometry,
    String? icon,
    String? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? name,
    List<Photo>? photos,
    String? placeId,
    String? reference,
    String? scope,
    List<String>? types,
    String? vicinity,
  }) =>
      NearbyPlace(
        geometry: geometry ?? this.geometry,
        icon: icon ?? this.icon,
        iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
        iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
        name: name ?? this.name,
        photos: photos ?? this.photos,
        placeId: placeId ?? this.placeId,
        reference: reference ?? this.reference,
        scope: scope ?? this.scope,
        types: types ?? this.types,
        vicinity: vicinity ?? this.vicinity,
      );

  factory NearbyPlace.fromJson(Map<String, dynamic> json) =>
      _$NearbyPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyPlaceToJson(this);
}

@JsonSerializable()
class Geometry {
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "viewport")
  final Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });

  Geometry copyWith({
    Location? location,
    Viewport? viewport,
  }) =>
      Geometry(
        location: location ?? this.location,
        viewport: viewport ?? this.viewport,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Viewport {
  @JsonKey(name: "northeast")
  final Location northeast;
  @JsonKey(name: "southwest")
  final Location southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  Viewport copyWith({
    Location? northeast,
    Location? southwest,
  }) =>
      Viewport(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest,
      );

  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);

  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "html_attributions")
  final List<String> htmlAttributions;
  @JsonKey(name: "photo_reference")
  final String photoReference;
  @JsonKey(name: "width")
  final int width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  Photo copyWith({
    int? height,
    List<String>? htmlAttributions,
    String? photoReference,
    int? width,
  }) =>
      Photo(
        height: height ?? this.height,
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        photoReference: photoReference ?? this.photoReference,
        width: width ?? this.width,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
