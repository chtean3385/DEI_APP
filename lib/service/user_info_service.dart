import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_number/mobile_number.dart';

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

  /// Fetch primary Google email (if logged in / available silently)
  static Future<String?> getUserEmail() async {
    await _ensureGoogleSignInInitialized();
    try {
      final account = await _googleSignIn.authenticate(scopeHint: scopes);
      if (account != null) {
        return account.email;
      } else {
        // If silent sign-in fails, prompt interactive auth
        final GoogleSignInAccount? signedAccount = await _googleSignIn
            .authenticate(scopeHint: scopes);
        return signedAccount?.email;
      }
    } on GoogleSignInException catch (e) {
      debugPrint("Google Sign-In error: $e");
      return null;
    } catch (e) {
      debugPrint("Unexpected error fetching email: $e");
      return null;
    }
  }

}



class MobileHelper {
  // Fetch Mobile Number or SIM Card Number
  static Future<String?> getMobileNumber() async {
    try {
      // Check & request permission
      if (!await MobileNumber.hasPhonePermission) {
        debugPrint("No permission, requesting...");
        await MobileNumber.requestPhonePermission; // ✅ fixed: no ()
        if (!await MobileNumber.hasPhonePermission) {
          debugPrint("Permission denied by user");
          return null;
        }
      }

      // Try fetching mobile number
      debugPrint("1111 - Trying to get number directly");
      final String? mobile = await MobileNumber.mobileNumber;
      debugPrint("3333 - $mobile");
      if (mobile != null && mobile.isNotEmpty) return mobile;

      // Fallback: get SIM card list
      debugPrint("2222 - Falling back to SIM list");
      final List<SimCard>? sims = await MobileNumber.getSimCards;
      if (sims != null && sims.isNotEmpty) {
        debugPrint("4444 - ${sims.first.number}");
        return sims.first.number;
      }

      return null;
    } on PlatformException catch (e) {
      debugPrint("Error fetching mobile number: ${e.message}");
      return null;
    }
  }
}
