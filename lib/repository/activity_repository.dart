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

  Future<List<String>> searchMembers(String token, String name) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_member_search": "",
      "search_name": name,
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
        final List<dynamic> data = responseData["member_result"];
        final members =
            data.map((member) => member["fullname"] as String).toList();

        return members;
      } else {
        throw Exception("No member result found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<List<String>> getTaggedBy(String token) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_list_member_receive_request_tag": "",
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
        final List<dynamic> data = responseData["member_list"];
        final members =
            data.map((member) => member["fullname"] as String).toList();

        return members;
      } else {
        throw Exception("No member result found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
