import 'dart:convert';

import 'package:emergency_test/models/nearby_place.dart';
import 'package:http/http.dart' as http;

class PlaceRepository {
  Future<void> getPlacesFromNearby({
    required double lat,
    required double lng,
    required String type,
  }) async {
    const apiKey = String.fromEnvironment("MAPS_ACCESS_TOKEN");

    // https://api.mapbox.com/search/geocode/v6/reverse?types=place&longitude=-78&latitude=38.89992678765707&access_token=pk.eyJ1IjoicGFqdW5hcjA0IiwiYSI6ImNsd3N5cWc5ejAxOGsya3M2a3J3dTM5Nm8ifQ.TrTpwKH1kK_PIqYYPXm1rw

    final params = {
      "types": type,
      "longitude": "lng",
      "latitude": "lat",
      "access_token": apiKey,
    };

    final placesNearybUrl = Uri.https(
      "api.mapbox.com",
      "/search/geocode/v6/reverse",
      params,
    );

    final response = await http.get(placesNearybUrl);
    print(response.body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      // print(responseData);
      // final listData = responseData["results"] as List;

      // print(listData);

      // return listData.map((data) => NearbyPlace.fromJson(data)).toList();
    } else {
      throw Exception(
        "Error retrieving places nearby: ${response.reasonPhrase}",
      );
    }
  }
}
