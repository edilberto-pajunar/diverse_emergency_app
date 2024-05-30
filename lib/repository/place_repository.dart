import 'dart:convert';

import 'package:emergency_test/models/nearby_place.dart';
import 'package:http/http.dart' as http;

class PlaceRepository {
  Future<List<NearbyPlace>> getPlacesFromNearby({
    required double lat,
    required double lng,
    required String type,
  }) async {
    const apiKey = String.fromEnvironment("PLACES_API_KEY");

    // https://places.googleapis.com/v1/places:searchNearby

    final body = {
      "includedTypes": [
        type.toLowerCase(),
      ],
      "maxResultCount": "5",
      "locationRestriction": {
        "circle": {
          "center": {
            "latitude": "$lat",
            "longitude": "$lng",
          },
          "radius": "500.0",
        },
      }
    };

    final placesNearybUrl = Uri.https(
      "places.googleapis.com",
      "/v1/places:searchNearby",
    );

    final headers = {
      "Content-Type": "application/json",
      "X-Goog-Api-Key": apiKey,
      "X-Goog-FieldMask":
          "places.displayName,places.id,places.formattedAddress,places.location,places.rating",
    };

    final response = await http.post(
      placesNearybUrl,
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (responseData.isEmpty) return [];
      final listData = responseData["places"];

      return (listData as List)
          .map((data) => NearbyPlace.fromJson(data))
          .toList();
    } else {
      throw Exception(
        "Error retrieving places nearby: ${response.reasonPhrase}",
      );
    }
  }
}
