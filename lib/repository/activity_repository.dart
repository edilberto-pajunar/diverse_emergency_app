import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/utils/api.dart';
import 'package:http/http.dart' as http;

class ActivityRepository {
  Future<String?> generateInvitationToken(String token) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "gene_token": "",
      "member_id": token,
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
        return responseData["token"];
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
    return null;
  }
}
