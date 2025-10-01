// providers.dart
import 'package:dei_champions/providers/controllers/auth/verify_otp_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../models/state_models/auth_state.dart';
import '../models/state_models/otp_state.dart';
import '../models/state_models/register_state.dart';
import '../models/state_models/signup_flow_state.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth/employee_login_controller.dart';
import 'controllers/auth/employer_register_controller.dart';
import 'controllers/auth/employer_register_page_view_controller.dart';
import 'controllers/auth/employee_register_controller.dart';
import 'controllers/auth/register_page_view_controller.dart';


final appProvider =
    AutoDisposeNotifierProvider<AppController, PageState>(
      () => AppController(),
    );


/// login controller

final loginProvider  = StateNotifierProvider.autoDispose<LoginController, AuthState>((ref) {
  return LoginController(ref);
});

/// registration controller
final registerProvider  = StateNotifierProvider.autoDispose<EmployeeRegisterController, RegisterState>((ref) {
  return EmployeeRegisterController(ref);
});
/// registration controller
final employerRegisterProvider  = StateNotifierProvider.autoDispose<EmployerRegisterController, EmployerRegisterState>((ref) {
  return EmployerRegisterController(ref);
});
/// verify OTP controller
final verifyOtpProvider  = StateNotifierProvider.autoDispose<VerifyOtpController, OtpState>((ref) {
  return VerifyOtpController(ref);
});

/// signup Page view Provider
final signupFlowControllerProvider =
AutoDisposeNotifierProvider<SignupFlowController, SignupFlowState>(
    SignupFlowController.new);

/// signup Page employer
final employerSignupFlowControllerProvider =
AutoDisposeNotifierProvider<EmployerSignupFlowController, SignupFlowState>(
    EmployerSignupFlowController.new);
