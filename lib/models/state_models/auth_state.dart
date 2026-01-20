import '../../constants/enums.dart';

class AuthState {
  final bool rememberMe;
  final String otp;
  final PageState pageState;
  final PageState restPageState;
  final bool? isMobileValid;
  final bool? isOtpSend;

  const AuthState({
    this.rememberMe = false,
    this.otp = '',
    this.pageState = PageState.initial,
    this.restPageState = PageState.initial,
    this.isMobileValid,
    this.isOtpSend,
  });

  AuthState copyWith({
    int? secondsRemaining,
    bool? rememberMe,
    String? otp,
    PageState? pageState,
    PageState? restPageState,
    bool? isMobileValid,
    bool? isOtpSend,
  }) {
    return AuthState(
      rememberMe: rememberMe ?? this.rememberMe,
      otp: otp ?? this.otp,
      pageState: pageState ?? this.pageState,
      restPageState: restPageState ?? this.restPageState,
      isMobileValid: isMobileValid ?? this.isMobileValid,
      isOtpSend: isOtpSend ?? this.isOtpSend,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          rememberMe == other.rememberMe &&
          otp == other.otp &&
          pageState == other.pageState &&
          restPageState == other.restPageState ;

  @override
  int get hashCode => rememberMe.hashCode ^ otp.hashCode ^ pageState.hashCode;
}
