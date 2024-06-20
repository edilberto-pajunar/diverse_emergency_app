import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs!.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  // Save a model instance to preferences
  static Future<bool> setModel<T>(String key, T model) async {
    assert(_prefs != null, 'Call initialize() before using preferences.');
    final String jsonString = jsonEncode(model);
    return await _prefs!.setString(key, jsonString);
  }

  static bool? getBool(String key) => _prefs!.getBool(key);

  static double? getDouble(String key) => _prefs!.getDouble(key);

  static int? getInt(String key) => _prefs!.getInt(key);

  static String? getString(String key) => _prefs!.getString(key);

  //for delete data
  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  static Future<bool> clear() async => await _prefs!.clear();
}
