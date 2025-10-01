import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/otp_state.dart';
import '../../../models/state_models/register_state.dart';
import '../../../service/auth_service.dart';
import '../../../ui/pages/auth/signup/widgets/registration_complete.dart';
import '../../../widgets/others/snack_bar.dart';

class VerifyOtpController extends StateNotifier<OtpState> {
  final Ref ref;

  VerifyOtpController(this.ref) : super(const OtpState());

  final AuthService _authService = AuthService();
  String? error;

  ///verifyEmailOtp
  Future<void> verifyEmailOtp(
    String otp, {
    bool isLogin = false,
    bool isEmployeeSignup = false,
    bool isEmployerSignup = false,
  }) async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.verifyEmailOtp(
        email: state.email ?? "",
        otp: otp,
      );

      setPageState(PageState.success);
      if (isEmployeeSignup) {
        Navigator.pop(navigatorKey.currentContext!, true);
      }
      if (isEmployerSignup) {
        //save user data/token
        submitRegistration(navigatorKey.currentContext!);
      } else {
        //save user data/token
        showSnackBar(result.message, duration: 3);
        AppNavigator.toBottomBar();
      }
      debugPrint("success - verifyEmailOtp");
    } catch (e) {
      setPageState(PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - verifyEmailOtp");
      debugPrint(e.toString());
    }
  }

  /// 🔹 Page state
  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }

  void setEmail(String? email) {
    state = state.copyWith(email: email);
  }
}
