import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/auth/auth_model.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/otp_state.dart';
import '../../../service/auth_service.dart';
import '../../../widgets/others/snack_bar.dart';

class VerifyOtpController extends StateNotifier<OtpState> {
  final Ref ref;

  VerifyOtpController(this.ref) : super(const OtpState());

  final AuthService _authService = AuthService();
  String? error;

  ///verifyEmailOtp
  Future<void> verifyOtp(
    String otp) async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.verifyEmailOtp(
        userId: state.userId ?? "",
        otp: otp,
      );

      setPageState(PageState.success);
      Navigator.pop(navigatorKey.currentContext!, true);
      showSnackBar(result.message, duration: 3);
      final AuthModel authModel = AuthModel.fromJson(result.data);
      AppNavigator.saveAuthDataAndLoadBottomBar(authModel: authModel);
      debugPrint("success - verifyOtp");
    } catch (e) {
      setPageState(PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - verifyOtp");
      debugPrint(e.toString());
    }
  }

  /// 🔹 Page state
  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }

  void setMobileUserId(String? email,String? userId) {
    state = state.copyWith(email: email,userId:userId );
  }
}
