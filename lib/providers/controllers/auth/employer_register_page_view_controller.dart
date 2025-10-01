import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_navigator.dart';
import '../../../models/state_models/signup_flow_state.dart';
import '../../../service/screen_shot_security_manager.dart';
import '../../../service/user_info_service.dart';

class EmployerSignupFlowController
    extends AutoDisposeNotifier<SignupFlowState> {
  late final PageController pageController;

  @override
  SignupFlowState build() {
    debugPrint("EmployerSignupFlowController init build");
    pageController = PageController();

    // If you ever allow swiping, keep state in sync with the controller.
    pageController.addListener(() {
      final idx = pageController.page?.round() ?? 0;
      if (idx != state.currentStep) {
        state = state.copyWith(currentStep: idx);
      }
    });

    // Proper cleanup for Notifier-based providers.
    ref.onDispose(() {
      debugPrint("EmployerSignupFlowController onDispose");
      pageController.dispose();
    });

    // Set your total steps here (or expose a setter).
    return const SignupFlowState(
      currentStep: 0,
      totalSteps: 3,
      otpVerified: false,
    );
  }

  Future<void> nextStep({VoidCallback? onComplete}) async {
    if (state.isLast) {
      // 👉 Only ask OTP if not verified already
      if (!state.otpVerified) {
        final registerDetails = await ref
            .read(employerRegisterProvider.notifier)
            .signUpEmployer();
        if (registerDetails != true) return; // stop if not verified
        // final verified = await AppNavigator.loadOtpScreenForSignup(false);
        final verified = await AppNavigator.loadOtpScreenForSignup(
          isFromEmployerSignup: true,
          email: ref
              .read(employerRegisterProvider).email ?? ""
        );

        /// need to change bool value as per mobile otp or email otp

        if (verified != true) return; // stop if not verified
        state = state.copyWith(otpVerified: true);
      }
    } else {
      final next = state.currentStep + 1;
      // Normal step navigation
      await pageController.nextPage(
        // next,
        duration: const Duration(milliseconds: 900),
        curve: Curves.fastOutSlowIn,
      );
      state = state.copyWith(currentStep: next);
    }
  }

  void previousStep() {
    if (!state.isFirst) {
      final prev = state.currentStep - 1;
      state = state.copyWith(currentStep: prev);
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void jumpTo(int index) {
    if (index < 0 || index >= state.totalSteps) return;
    state = state.copyWith(currentStep: index);
    pageController.jumpToPage(index);
  }

  void setTotalSteps(int total) {
    state = state.copyWith(totalSteps: total.clamp(1, 1000));
  }

  iniController() {
    _autoFillUserData();
    ScreenShotProtector.enableScreenProtection();
  }

  disposeValues() {
    ScreenShotProtector.disableScreenProtection();
  }

  Future<void> _autoFillUserData() async {
    debugPrint("EmployerSignupFlowController _autoFillUserData");
    final email = await UserInfoService.getUserEmail();
    final mobile = await MobileHelper.getMobileNumber();

    state = state.copyWith(email: email, phone: mobile);
  }
}
