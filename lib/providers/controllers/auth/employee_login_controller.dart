import 'dart:async';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/auth_state.dart';
import '../../../service/auth_service.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeLoginController extends StateNotifier<AuthState> {
  final Ref ref;

  EmployeeLoginController(this.ref) : super(const AuthState());

  final AuthService _authService = AuthService();
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();

  String? error;

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
  /// 🔹 Trigger Signup API using state data
  Future<void> signInEmployee() async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.employeeSignIn(
        email: emailNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      showSnackBar(result.message, duration: 3);
      setPageState(PageState.success);
      AppNavigator.loadOtpScreen();
      debugPrint("success - signInEmployee");
    } catch (e) {
      setPageState(PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - signInEmployee");
      debugPrint(e.toString());
    }
  }


}
