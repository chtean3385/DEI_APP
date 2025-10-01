import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/register_state.dart';
import '../../../service/auth_service.dart';
import '../../../ui/pages/auth/signup/widgets/registration_complete.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployerRegisterController extends StateNotifier<EmployerRegisterState> {
  final Ref ref;

  EmployerRegisterController(this.ref) : super(const EmployerRegisterState());

  final AuthService _authService = AuthService();
  String? error;

  /// 🔹 Trigger Signup API using state data
  Future<bool> signUpEmployer() async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.employerSignUp(
        name: state.name ?? "",
        email: state.email ?? "",
        password: state.password ?? "",
        mobile: state.mobile ?? "",
        address: state.address ?? "",
        city: state.city ?? "",
        companyAccountType: state.companyAccountType == true
            ? "individual"
            : "company",
        companyDesignation: state.companyDesignation ?? "",
        companyEmail: state.companyEmail ?? "",
        companyName: state.companyName ?? "",
        companySize: state.companySize ?? "",
        companyWebsite: state.companyWebsite ?? "",
        pinCode: state.pinCode ?? "",
        state: state.state ?? "",
        acceptTerms: state.acceptTerms ?? false,
        roleId: 2,
      );
      // showSnackBar(result.message, duration: 3);
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

  void setCompanyName(String val) => state = state.copyWith(companyName: val);

  void setCompanyEmail(String val) => state = state.copyWith(companyEmail: val);

  void setDesignation(String val) =>
      state = state.copyWith(companyDesignation: val);

  void setWebSite(String val) => state = state.copyWith(companyWebsite: val);

  void setAddress(String val) => state = state.copyWith(address: val);

  void setState(String val) => state = state.copyWith(state: val);

  void setCity(String val) => state = state.copyWith(city: val);

  void setPinCode(String val) => state = state.copyWith(pinCode: val);

  void setAcceptTerms(bool val) => state = state.copyWith(acceptTerms: val);

  void toggleAcceptTerms() {
    state = state.copyWith(acceptTerms: !(state.acceptTerms ?? false));
  }

  void setCompanyAccountType(bool val) =>
      state = state.copyWith(companyAccountType: val);

  /// 🔹 Page state
  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }
}
