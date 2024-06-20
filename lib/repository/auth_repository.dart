import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/models/member.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:emergency_test/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  Future<AppUser> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_login_project_911": "",
      "email": email,
      "password": password,
    };

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    log("Calling: $uri");

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;
      log("$responseData");

      return AppUser.fromJson(responseData);
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<UserCredential> createAccount(String email, String password) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw Exception(e as Exception);
    }
  }

  Future<void> logOut() async {
    try {
      // await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // using sos api

  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String middleName,
    required String mobile,
    required String country,
    required String birthday,
    required String location,
    required String countryCode,
    required String duressPassword,
    required String confirmDuressPassword,
    required String relationship,
  }) async {
    final params = {
      "submit_register_project_911": "",
      "email": email,
      "username": username,
      "password": password,
      "confirm_password": confirmPassword,
      "fname": firstName,
      "lname": lastName,
      "mname": middleName,
      "mobile": mobile,
      "country": country,
      "birthday": birthday,
      "location": location,
      "country_code": countryCode,
      "duress_password": duressPassword,
      "confirm_duress_password": confirmDuressPassword,
      "relationship": relationship,
    };

    final uri = Uri.https(
      ApiClass.baseUrl,
      ApiClass.path,
    );

    log("Calling: $uri");

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      log("Response: $responseData");
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<void> setLoginToken(String email) async {
    LocalRepository.setString("email", email);
  }

  String? getEmailToken() {
    return LocalRepository.getString("email");
  }

  String? getPasswordToken() {
    return LocalRepository.getString("password");
  }

  Future<String> encodeToken(String memberId) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "encode_password": "",
      "id": memberId,
    };

    print(memberId);

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    log("Calling: $uri");

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      log(responseData);

      return responseData;
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<Member> getMemberInfo(String token) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    final params = {
      "submit_member_visit_profile": "",
      "member_id": token,
      "visitor_id": token,
    };

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    log("Calling: $uri");

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString());
      // log("$responseData");
      print("Response: $responseData");

      return Member.fromJson(responseData);
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }

  Future<void> sendEmailVerif(String token) async {
    final uri = Uri.https(ApiClass.baseUrl, ApiClass.path);

    print(token);

    final params = {
      "submit_member_submit_resend_verification_code": "",
      "member_id": token,
    };

    final request = http.MultipartRequest("POST", uri)..fields.addAll(params);

    log("Calling: $uri");

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString());
      log("$responseData");
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
