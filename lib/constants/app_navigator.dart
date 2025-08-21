import 'package:dei_champions/ui/pages/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../ui/pages/auth/login_screen.dart';
import '../ui/pages/auth/otp/otp_screen.dart';

class AppNavigator {
  // static void toBottomBar() {
  //   Navigator.pushAndRemoveUntil(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => const BottomBar()),
  //     (route) => false,
  //   );
  // }
  //
  // static void toLoginScreen() {
  //   Navigator.pushAndRemoveUntil(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => const LoginScreen()),
  //     (route) => false,
  //   );
  // }
  //
  // static void pushAndRemoveAll(Widget page) {
  //   Navigator.pushAndRemoveUntil(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => page),
  //     (route) => false,
  //   );
  // }
  // static void toMyAccountScreen() {
  //   Navigator.push(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => const MyAccountScreen()),
  //   );
  // }

  static loadSignInScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SignInScreen()),
          (route) => false,
    );
  }

  static loadSignUpScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SignupScreen()),
          (route) => false,
    );
  }
  static loadOtpScreen({bool isFromLogout = false}) {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => OTPVerificationScreen()),
          (route) => false,
    );
  }
}
