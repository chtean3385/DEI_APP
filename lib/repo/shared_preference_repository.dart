import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  static const String KEY_TOKEN = "KEY_TOKEN";
  static const String KEY_USER_ID = "KEY_USER_ID";
  static const String HAS_SEEN_ON_BOARDING = "HAS_SEEN_ON_BOARDING";

  static Future<void> setToken(String token) async {
    debugPrint("set token -- $token");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_TOKEN, token);
  }
  static Future<void> setUserId(String userId) async {
    debugPrint("setUserId -- $userId");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_USER_ID, userId);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(KEY_TOKEN) ?? "";
    debugPrint("getToken -- $token");
    return token;
  }
  static Future<String> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(KEY_USER_ID) ?? "";
    debugPrint("getUserId -- $userId");
    return userId;
  }
  static Future<void> setHasSeenOnboarding(bool hasSeenOnboarding) async {
    debugPrint("Set hasSeenOnboarding -- $hasSeenOnboarding");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(HAS_SEEN_ON_BOARDING, hasSeenOnboarding);
  }
  static Future<bool> getHasSeenOnboarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = preferences.getBool(HAS_SEEN_ON_BOARDING) ?? false;
    debugPrint("hasSeenOnboarding -- $hasSeenOnboarding");
    return hasSeenOnboarding;
  }

}
