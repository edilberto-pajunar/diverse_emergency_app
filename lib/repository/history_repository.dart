import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/models/history.dart';
import 'package:emergency_test/utils/api.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  Future<List<History>> getHistories(String token) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_member_history_request_sos": "",
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
        final data = (responseData["member_history_list"]);

        final histories =
            (data as List).map((history) => History.fromJson(history)).toList();

        return histories;
      } else {
        throw Exception("No history was found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
