import 'dart:convert';
import 'dart:developer';

import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/utils/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  AppUser? _toAppUser(User? firebaseUser) {
    if (firebaseUser == null) return null;

    return AppUser(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      email: firebaseUser.email,
      phoneNumber: firebaseUser.phoneNumber,
      photoUrl: firebaseUser.photoURL,
    );
  }

  AppUser? get currentUser => _toAppUser(_firebaseAuth.currentUser);

  Stream<AppUser?> get currentUserStream =>
      _firebaseAuth.authStateChanges().map(_toAppUser);

  Future<UserCredential> signInAnonymously() async {
    return await _firebaseAuth.signInAnonymously();
  }

  Future<UserCredential?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw Exception(e as Exception);
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
      await _firebaseAuth.signOut();
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
    final body = {
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

    final request = http.MultipartRequest("POST", uri)..fields.addAll(body);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      log("Response: $responseData");
    } else {
      throw Exception("Something went wrong. ${response.reasonPhrase}");
    }
  }
}
