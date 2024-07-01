import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/contact_person.dart';
import 'package:emergency_test/models/explore.dart';
import 'package:emergency_test/models/unresolved_request.dart';
import 'package:emergency_test/utils/api.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<Explore> sendEmergency(
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
        final explore = Explore.fromJson(responseData);
        return explore;
      } else {
        throw Exception("No history was found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<List<ContactPerson>> getContactPersons(
    String token,
    bool primary,
  ) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final primaryParams = {
      "submit_list_member_primary_approved_tag": "",
      "member_id": token,
    };

    final tagParams = {
      "submit_list_member_sender_approved_tag": "",
      "member_id": token,
    };

    final request = http.MultipartRequest("POST", uri)
      ..fields.addAll(primary ? primaryParams : tagParams);

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
        final data = primary
            ? responseData["member_list_primary"]
            : responseData["memberR_list"];
        final contacts = (data as List)
            .map((contact) => ContactPerson.fromJson(contact))
            .toList();

        return contacts;
      } else {
        throw Exception("No contact was found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<List<UnresolvedRequest>> getUnresolvedRequest(
    String token,
  ) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_request_list_unresolved": "",
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
        final data = responseData["unresolve_list"];
        final requests = (data as List)
            .map((request) => UnresolvedRequest.fromJson(request))
            .toList();
        return requests;
      } else {
        throw Exception("No requests was found");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<String> resolveRequest(
    String token,
    String locationId,
  ) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_request_resolved": "",
      "member_id": token,
      "location_id": locationId,
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
        throw Exception("Error resolving");
      }
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
