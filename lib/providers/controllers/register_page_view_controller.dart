import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../models/state_models/signup_flow_state.dart';



/// Controller
class SignupFlowController extends AutoDisposeNotifier<SignupFlowState> {
  late final PageController pageController;

  @override
  SignupFlowState build() {
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
      pageController.dispose();
    });

    // Set your total steps here (or expose a setter).
    return const SignupFlowState(currentStep: 0, totalSteps: 6);
  }

  void nextStep({VoidCallback? onComplete}) {
    if (!state.isLast) {
      final next = state.currentStep + 1;
      state = state.copyWith(currentStep: next);
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onComplete?.call();
    }
  }

  void previousStep() {
    if (!state.isFirst) {
      final prev = state.currentStep - 1;
      state = state.copyWith(currentStep: prev);
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
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
}



