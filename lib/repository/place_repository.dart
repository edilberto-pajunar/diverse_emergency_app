import 'dart:convert';

import 'package:emergency_test/models/nearby_place.dart';
import 'package:http/http.dart' as http;

class PlaceRepository {
  Future<List<NearbyPlace>> getPlacesFromNearby({
    required double lat,
    required double lng,
    required String type,
  }) async {
    const apiKey = String.fromEnvironment("MAPS_API_KEY");

    final params = {
      "location": "$lat,$lng",
      "radius": "1500",
      "type": type,
      "key": apiKey,
    };

    final placesNearybUrl = Uri.https(
      "maps.googleapis.com",
      "/maps/api/place/nearbysearch/json",
      params,
    );

    final response = await http.get(placesNearybUrl);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      final listData = responseData["results"] as List;

      print(listData);

      return listData.map((data) => NearbyPlace.fromJson(data)).toList();
    } else {
      throw Exception(
        "Error retrieving places nearby: ${response.reasonPhrase}",
      );
    }
  }
}
