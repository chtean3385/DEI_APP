class ForgotPasswordValidationResult {
  final bool isValid;
  final String? errorMessage;

  const ForgotPasswordValidationResult({
    required this.isValid,
    this.errorMessage,
  });
}

class ForgotPasswordValidator {
  static const String _emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  static ForgotPasswordValidationResult validateEmail(String email) {
    if (email.isEmpty) {
      return const ForgotPasswordValidationResult(
        isValid: false,
        errorMessage: 'Please enter your email address',
      );
    }

    if (!RegExp(_emailPattern).hasMatch(email)) {
      return const ForgotPasswordValidationResult(
        isValid: false,
        errorMessage: 'Please enter a valid email address',
      );
    }

    return const ForgotPasswordValidationResult(isValid: true);
  }

  static bool isValidEmail(String email) {
    return RegExp(_emailPattern).hasMatch(email);
  }
}