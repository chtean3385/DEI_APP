import '../../constants/enums.dart';

class AuthState {
  final bool? isOtpValid;
  final String otp;
  final PageState pageState;

  const AuthState({
    this.isOtpValid ,
    this.otp = '',
    this.pageState = PageState.initial,
  });

  AuthState copyWith({
    int? secondsRemaining,
    bool? isOtpValid,
    String? otp,
    PageState? pageState,
  }) {
    return AuthState(
      isOtpValid: isOtpValid ?? this.isOtpValid,
      otp: otp ?? this.otp,
      pageState: pageState ?? this.pageState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AuthState &&
              runtimeType == other.runtimeType &&
              isOtpValid == other.isOtpValid &&
              otp == other.otp &&
              pageState == other.pageState;

  @override
  int get hashCode =>
      isOtpValid.hashCode ^
      otp.hashCode ^
      pageState.hashCode;
}
