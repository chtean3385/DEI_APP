import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/register_state.dart';
import '../../../service/auth_service.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeRegisterController extends StateNotifier<RegisterState> {
  final Ref ref;

  EmployeeRegisterController(this.ref) : super(const RegisterState());

  final AuthService _authService = AuthService();
  String? error;

  /// 🔹 Trigger Signup API using state data
  Future<bool> signUpEmployee() async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.employeeSignUp(
        name: state.name ?? "",
        email: state.email ?? "",
        password: state.password ?? "",
        mobile: state.mobile ?? "",
        workStatus: state.workStatus ?? "",
        acceptTerms: state.acceptTerms ?? false,
        roleId: 3,
      );

      showSnackBar(result.message, duration: 3);
      setPageState(PageState.success);
      if (result.success != true) {
        return false; // not registered yet
      } else {
        return true; // already registered
      }

      /// If OTP required, you can redirect here
      // AppNavigator.loadSignInScreen();
    } catch (e) {
      setPageState(PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - signup");
      debugPrint(e.toString());
      return false; // not registered yet
    }
  }


  /// 🔹 Update fields from screens
  void setName(String val) => state = state.copyWith(name: val);

  void setEmail(String val) => state = state.copyWith(email: val);

  void setPassword(String val) => state = state.copyWith(password: val);

  void setMobile(String val) => state = state.copyWith(mobile: val);

  void setWorkStatus(String val) => state = state.copyWith(workStatus: val);

  void setAcceptTerms(bool val) => state = state.copyWith(acceptTerms: val); void toggleAcceptTerms() {
    state = state.copyWith(acceptTerms: !(state.acceptTerms ?? false));
  }



  /// 🔹 Page state
  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }
}
