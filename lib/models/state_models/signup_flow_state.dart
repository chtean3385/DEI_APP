// signup_flow_state.dart
class SignupFlowState {
  final int currentStep;
  final int totalSteps;
  final String? email;
  final String? phone;
  final bool otpVerified;

  const SignupFlowState({
    required this.currentStep,
    required this.totalSteps,
    required this.otpVerified,
    this.email,
    this.phone,
  });

  SignupFlowState copyWith({
    int? currentStep,
    int? totalSteps,
    bool? otpVerified,
    String? email,
    String? phone,
  }) {
    return SignupFlowState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      otpVerified: otpVerified ?? this.otpVerified,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  bool get isFirst => currentStep == 0;
  bool get isLast => currentStep == totalSteps - 1;
}
