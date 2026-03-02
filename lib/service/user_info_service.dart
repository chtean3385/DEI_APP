import 'dart:async';
import 'dart:io';
import 'package:account_picker/account_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserInfoService {
  // ─── iOS: Google Sign-In ─────────────────────────────────────
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool _isGoogleSignInInitialized = false;


  static const String _webClientId =
      "325714813742-s9mq0r87p08nej5c2sppde3vpvts1u66.apps.googleusercontent.com";

  static const List<String> scopes = <String>['email'];

  // ─── iOS init (unchanged) ────────────────────────────────────
  static Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize(serverClientId: _webClientId);
      _isGoogleSignInInitialized = true;
    } catch (e) {
      debugPrint('Failed to initialize Google Sign-In: $e');
    }
  }

  static Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) await _initializeGoogleSignIn();
  }

  // ─── Android init ────────────────────────────────────────────



  // ─── Public entry point ──────────────────────────────────────
  static Future<String?> getUserEmail() async {
    if (Platform.isIOS) return _getEmailIOS();
    if (Platform.isAndroid) return _getEmailAndroid();
    return null;
  }

  // ─── iOS: exact existing logic, untouched ────────────────────
  static Future<String?> _getEmailIOS() async {
    await _ensureGoogleSignInInitialized();
    try {
      final GoogleSignInAccount? account =
      await _googleSignIn.attemptLightweightAuthentication();
      if (account != null) return account.email;

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

// ─── Android: account_picker (NEW) ───────────────────────────
  static Future<String?> _getEmailAndroid() async {
    try {
      final EmailResult? emailResult = await AccountPicker.emailHint();
      print(emailResult);
      // final String? email = await AccountPicker.emailHint();
      debugPrint("Android account picker email: ${emailResult?.email}");
      return emailResult?.email;
    } catch (e) {
      debugPrint("Android account picker error: $e");
      return null;
    }
  }
}