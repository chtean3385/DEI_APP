import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserInfoService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool _isGoogleSignInInitialized = false;

  /// Google scopes you need
  static const List<String> scopes = <String>['email'];

  /// Initialize Google Sign-In (must be done before use)
  static Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize(
        serverClientId:
        "325714813742-s9mq0r87p08nej5c2sppde3vpvts1u66.apps.googleusercontent.com",
      );
      _isGoogleSignInInitialized = true;
    } catch (e) {
      debugPrint('Failed to initialize Google Sign-In: $e');
    }
  }

  /// Ensure initialized before usage
  static Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  /// Try to fetch user email (silent first, fallback to interactive auth)
  static Future<String?> getUserEmail() async {
    await _ensureGoogleSignInInitialized();

    try {
      // ✅ Silent sign-in replacement
      final GoogleSignInAccount? account =
      await _googleSignIn.attemptLightweightAuthentication();

      if (account != null) {
        return account.email;
      }

      // 🚨 Only fallback to interactive login if needed
      final GoogleSignInAccount signedAccount =
      await _googleSignIn.authenticate(scopeHint: scopes);

      return signedAccount.email;
    } on GoogleSignInException catch (e) {
      debugPrint("Google Sign-In error: $e");
      return null;
    } catch (e) {
      debugPrint("Unexpected error fetching email: $e");
      return null;
    }
  }
}




