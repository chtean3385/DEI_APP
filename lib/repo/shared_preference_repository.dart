import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  static const String KEY_TOKEN = "KEY_TOKEN";
  static const String KEY_USER_ID = "KEY_USER_ID";
  static const String KEY_EMAIL = "KEY_EMAIL";
  static const String KEY_PASSWORD = "KEY_PASSWORD";
  static const String KEY_REMEMBER_ME = "KEY_REMEMBER_ME";
  static const String HAS_SEEN_ON_BOARDING = "HAS_SEEN_ON_BOARDING";


  static Future<void> setToken(String token) async {
    debugPrint("set token -- $token");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_TOKEN, token);
  }
  static Future<void> setRememberMe(bool remember) async {
    debugPrint("set remember -- $remember");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(KEY_REMEMBER_ME, remember);
  }
  static Future<void> setEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(KEY_USER_ID) ?? "";
    await preferences.setString("$userId-$KEY_EMAIL", email);
  }
  static Future<void> setPassword(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(KEY_USER_ID) ?? "";
    await preferences.setString("$userId-$KEY_PASSWORD", password);
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
  static Future<bool> getRememberMe() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool remember = preferences.getBool(KEY_REMEMBER_ME) ?? false;
    debugPrint("getremember -- $remember");
    return remember;
  }
  static Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(KEY_USER_ID) ?? "";
    String email = preferences.getString("$userId-$KEY_EMAIL") ?? "";
    debugPrint("getEmail -- $email");
    return email;
  }
  static Future<String> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString(KEY_USER_ID) ?? "";
    String password = preferences.getString("$userId-$KEY_PASSWORD") ?? "";
    return password;
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
