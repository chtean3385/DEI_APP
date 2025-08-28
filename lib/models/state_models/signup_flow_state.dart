// signup_flow_state.dart
class SignupFlowState {
  final int currentStep;
  final int totalSteps;
  final String? email;
  final String? phone;

  const SignupFlowState({
    required this.currentStep,
    required this.totalSteps,
    this.email,
    this.phone,
  });

  SignupFlowState copyWith({
    int? currentStep,
    int? totalSteps,
    String? email,
    String? phone,
  }) {
    return SignupFlowState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  bool get isFirst => currentStep == 0;
  bool get isLast => currentStep == totalSteps - 1;
}
