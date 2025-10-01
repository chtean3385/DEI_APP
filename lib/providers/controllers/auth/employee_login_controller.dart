import 'dart:async';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/state_models/auth_state.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../service/auth_service.dart';
import '../../../widgets/others/snack_bar.dart';

class LoginController extends StateNotifier<AuthState> {
  final Ref ref;

  LoginController(this.ref) : super(const AuthState()){
    loadSavedCredentials();
  }

  final AuthService _authService = AuthService();
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();

  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }

  ///Sign In ///
  Future<void> signIn() async {
    setPageState(PageState.loading);
    try {
      final BaseModel result = await _authService.employeeSignIn(
        email: emailNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      showSnackBar(result.message, duration: 3);
     if(state.rememberMe) saveCredentials();
      setPageState(PageState.success);
      AppNavigator.loadOtpScreen(emailNameController.text.trim());
      debugPrint("success - signInEmployee");
    } catch (e) {
      setPageState(PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - signInEmployee");
      debugPrint(e.toString());
    }
  }

  /// REMEMBER ME ///
  void toggleRememberMe(bool val) {
    state = state.copyWith(rememberMe: val);
     SharedPreferenceRepository.setRememberMe(val);
  }

  Future<void> loadSavedCredentials() async {
    final bool remember = await SharedPreferenceRepository.getRememberMe();
    state = state.copyWith(rememberMe: remember);
    if(remember){
      final savedEmail = await SharedPreferenceRepository.getEmail();
      final savedPassword = await SharedPreferenceRepository.getPassword();

      if (savedEmail.isNotEmpty) emailNameController.text = savedEmail;
      if (savedPassword.isNotEmpty) passwordController.text = savedPassword;
    }
  }

  Future<void> saveCredentials() async {
    await SharedPreferenceRepository.setRememberMe(true);
    await SharedPreferenceRepository.setEmail(emailNameController.text.trim());
    await SharedPreferenceRepository.setPassword(
      passwordController.text.trim(),
    );
  }
}
