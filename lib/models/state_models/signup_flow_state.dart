class SignupFlowState {
  final int currentStep;
  final int totalSteps;

  const SignupFlowState({
    required this.currentStep,
    required this.totalSteps,
  });

  bool get isFirst => currentStep == 0;
  bool get isLast  => currentStep == totalSteps - 1;

  SignupFlowState copyWith({
    int? currentStep,
    int? totalSteps,
  }) {
    return SignupFlowState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
    );
  }
}