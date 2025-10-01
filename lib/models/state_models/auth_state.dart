import '../../constants/enums.dart';

class AuthState {
  final bool rememberMe;
  final String otp;
  final PageState pageState;

  const AuthState({
    this.rememberMe = false ,
    this.otp = '',
    this.pageState = PageState.initial,
  });

  AuthState copyWith({
    int? secondsRemaining,
    bool? rememberMe,
    String? otp,
    PageState? pageState,
  }) {
    return AuthState(
      rememberMe: rememberMe ?? this.rememberMe,
      otp: otp ?? this.otp,
      pageState: pageState ?? this.pageState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AuthState &&
              runtimeType == other.runtimeType &&
              rememberMe == other.rememberMe &&
              otp == other.otp &&
              pageState == other.pageState;

  @override
  int get hashCode =>
      rememberMe.hashCode ^
      otp.hashCode ^
      pageState.hashCode;
}
