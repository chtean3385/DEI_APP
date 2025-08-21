import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_navigator.dart';
import '../../constants/enums.dart';
import '../../models/state_models/auth_state.dart';

class AuthController extends AutoDisposeNotifier<AuthState> {
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();

  // final AuthService _authService = AuthService();
  String? error;

  @override
  AuthState build() {
    ref.onDispose(() {
      // userNameController.dispose();
      // mobileNumberController.dispose();
      // emailNameController.dispose();
      // passwordController.dispose();
    });

    return AuthState();
  }

  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }

  void initController() {
    setPageState(PageState.initial);
    emailNameController.clear();
    passwordController.clear();
  }

  void setOtp(String val) {
    state = state.copyWith(isOtpValid: val.length == 6, otp: val);
  }

  void updateIsOtpValid(bool val) {
    if (state.isOtpValid != val) {
      debugPrint("isOtpValid Updated to: $val");
      state = state.copyWith(isOtpValid: val);
    }
  }

  ///Sign In ///
  Future<void> signInUser(BuildContext context) async {
    setPageState(PageState.loading);
    await Future.delayed(Duration(seconds: 3));
    AppNavigator.loadOtpScreen();
    setPageState(PageState.success);
    // try {
    //   final BaseModel result = await _authService.signIn(
    //     phoneNumber: mobileNumberController.text.trim(),
    //   );
    //   showOverlaySnackBar(context, result.message);
    //   loadOtpScreen();
    //   setPageState(PageState.success);
    // } catch (e) {
    //   setPageState(PageState.error);
    //   showOverlaySnackBar(context, e.toString());
    //   debugPrint("catch - signInUser");
    //   debugPrint(e.toString());
    // }
  }

}
