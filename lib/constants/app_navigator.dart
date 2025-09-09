import 'package:dei_champions/ui/pages/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../ui/pages/auth/forgot_password/forgot_password_screen.dart';
import '../ui/pages/auth/login_screen.dart';
import '../ui/pages/auth/otp/otp_screen.dart';
import '../ui/pages/auth/signup/choose_signup_type.dart';
import '../ui/pages/auth/signup_employer/signup_employer_screen.dart';
import '../ui/pages/main/bottom_bar.dart';
import '../ui/pages/search/job_search_result_screen.dart';

class AppNavigator {
  static void toBottomBar() {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => const BottomBar()),
      (route) => false,
    );
  }
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

  static loadCommonSignUp() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) =>  ChooseSignupType()),
          // (route) => false,
    );
  }
  static loadSignUpScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) =>  SignupScreen()),
          // (route) => false,
    );
  }
  static loadEmployerSignUpScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) =>  SignupEmployerScreen()),
          // (route) => false,
    );
  }

  static Future<bool> loadOtpScreenForSignup(bool isEmployer) async {
    final result = await Navigator.push<bool>(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) =>  OTPVerificationScreen(isEmployer: isEmployer,emailOrMobile: isEmployer?  "user@example.com" : "1234567890" ,),
      ),
    );

    return result ?? false; // default false if user backs out
  }

  static loadForgotPasswordScreen({bool isFromLogout = false}) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
    );
  }
  static loadJobSearchScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => JobSearchResultScreen()),
    );
  }


}
