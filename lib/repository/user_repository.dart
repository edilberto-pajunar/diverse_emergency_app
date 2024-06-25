import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/utils/api.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<String> sendEmergency(
    String token,
    AppLocation location,
  ) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_finder_lat_lang": "",
      "member_id": token,
      "type_request": "explore",
      "latitude": "${location.location.$1}",
      "longitude": "${location.location.$2}",
    };

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    log("Calling: $uri");

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString());
      // log("$responseData");
      log("Response: $responseData");

      if (responseData["result"] == 0) {
        throw "Something went wrong. ${responseData["message"]}";
      }

      if (responseData["result"] == 1) {
        return responseData["message"];
      } else {
        throw Exception("No history was found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
