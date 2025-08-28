import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../models/state_models/signup_flow_state.dart';
import '../../service/user_info_service.dart';
import '../../ui/pages/auth/signup/widgets/registration_complete.dart';



/// Controller
class SignupFlowController extends AutoDisposeNotifier<SignupFlowState> {
  late final PageController pageController;

  @override
  SignupFlowState build() {
    pageController = PageController();
    _autoFillUserData();
    // If you ever allow swiping, keep state in sync with the controller.
    pageController.addListener(() {
      final idx = pageController.page?.round() ?? 0;
      if (idx != state.currentStep) {
        state = state.copyWith(currentStep: idx);
      }
    });

    // Proper cleanup for Notifier-based providers.
    ref.onDispose(() {
      pageController.dispose();
    });

    // Set your total steps here (or expose a setter).
    return const SignupFlowState(currentStep: 0, totalSteps: 7);
  }

  void nextStep({VoidCallback? onComplete}) {
    if (!state.isLast) {
      final next = state.currentStep + 1;
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      state = state.copyWith(currentStep: next);
    } else {
      submitRegistration(navigatorKey.currentContext!);
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

  Future<void> _autoFillUserData() async {
    final email = await UserInfoService.getUserEmail();
    final mobile = await MobileHelper.getMobileNumber();

    state = state.copyWith(
      email: email,
      phone: mobile,
    );
  }

}
class EmployerSignupFlowController extends AutoDisposeNotifier<SignupFlowState> {
  late final PageController pageController;

  @override
  SignupFlowState build() {
    pageController = PageController();
    // _autoFillUserData();
    // If you ever allow swiping, keep state in sync with the controller.
    pageController.addListener(() {
      final idx = pageController.page?.round() ?? 0;
      if (idx != state.currentStep) {
        state = state.copyWith(currentStep: idx);
      }
    });

    // Proper cleanup for Notifier-based providers.
    ref.onDispose(() {
      pageController.dispose();
    });

    // Set your total steps here (or expose a setter).
    return const SignupFlowState(currentStep: 0, totalSteps: 1);
  }

  void nextStep({VoidCallback? onComplete}) {
    if (!state.isLast) {
      final next = state.currentStep + 1;
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      state = state.copyWith(currentStep: next);
    } else {
      submitRegistration(navigatorKey.currentContext!);
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

  Future<void> _autoFillUserData() async {
    final email = await UserInfoService.getUserEmail();
    final mobile = await MobileHelper.getMobileNumber();

    state = state.copyWith(
      email: email,
      phone: mobile,
    );
  }

}




