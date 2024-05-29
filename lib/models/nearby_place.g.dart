// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyPlace _$NearbyPlaceFromJson(Map<String, dynamic> json) => NearbyPlace(
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['icon_background_color'] as String?,
      iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
      name: json['name'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String,
      reference: json['reference'] as String?,
      scope: json['scope'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vicinity: json['vicinity'] as String?,
    );

Map<String, dynamic> _$NearbyPlaceToJson(NearbyPlace instance) =>
    <String, dynamic>{
      'geometry': instance.geometry,
      'icon': instance.icon,
      'icon_background_color': instance.iconBackgroundColor,
      'icon_mask_base_uri': instance.iconMaskBaseUri,
      'name': instance.name,
      'photos': instance.photos,
      'place_id': instance.placeId,
      'reference': instance.reference,
      'scope': instance.scope,
      'types': instance.types,
      'vicinity': instance.vicinity,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      viewport: Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Viewport _$ViewportFromJson(Map<String, dynamic> json) => Viewport(
      northeast: Location.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: Location.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewportToJson(Viewport instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      height: (json['height'] as num).toInt(),
      htmlAttributions: (json['html_attributions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoReference: json['photo_reference'] as String,
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };
