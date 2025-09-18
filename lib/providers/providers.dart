// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../models/state_models/auth_state.dart';
import '../models/state_models/register_state.dart';
import '../models/state_models/signup_flow_state.dart';
import 'controllers/app_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/employer_register_page_view_controller.dart';
import 'controllers/employee_register_controller.dart';
import 'controllers/register_page_view_controller.dart';


final appProvider =
    AutoDisposeNotifierProvider<AppController, PageState>(
      () => AppController(),
    );


/// authentication controller
final loginProvider =
AutoDisposeNotifierProvider<LoginController, AuthState>(LoginController.new);

/// registration controller
final registerProvider  = StateNotifierProvider.autoDispose<EmployeeRegisterController, RegisterState>((ref) {
  return EmployeeRegisterController(ref);
});

/// signup Page view Provider
final signupFlowControllerProvider =
AutoDisposeNotifierProvider<SignupFlowController, SignupFlowState>(
    SignupFlowController.new);

/// signup Page employer
final employerSignupFlowControllerProvider =
AutoDisposeNotifierProvider<EmployerSignupFlowController, SignupFlowState>(
    EmployerSignupFlowController.new);
