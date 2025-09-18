import '../../constants/enums.dart';

class RegisterState {
  final bool? isOtpValid;
  final String otp;
  final String? name;
  final String? email;
  final String? password;
  final String? mobile;
  final String? workStatus;
  final bool? acceptTerms;
  final int? roleId;

  final PageState pageState;

  const RegisterState({
    this.isOtpValid,
    this.otp = '',
    this.name,
    this.email,
    this.password,
    this.mobile,
    this.workStatus,
    this.acceptTerms,
    this.roleId,
    this.pageState = PageState.initial,
  });

  RegisterState copyWith({
    bool? isOtpValid,
    String? otp,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? workStatus,
    bool? acceptTerms,
    int? roleId,
    PageState? pageState,
  }) {
    return RegisterState(
      isOtpValid: isOtpValid ?? this.isOtpValid,
      otp: otp ?? this.otp,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      workStatus: workStatus ?? this.workStatus,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      roleId: roleId ?? this.roleId,
      pageState: pageState ?? this.pageState,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
      "workStatus": workStatus,
      "acceptTerms": acceptTerms,
      "roleId": roleId,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RegisterState &&
              runtimeType == other.runtimeType &&
              isOtpValid == other.isOtpValid &&
              otp == other.otp &&
              name == other.name &&
              email == other.email &&
              password == other.password &&
              mobile == other.mobile &&
              workStatus == other.workStatus &&
              acceptTerms == other.acceptTerms &&
              roleId == other.roleId &&
              pageState == other.pageState;

  @override
  int get hashCode =>
      isOtpValid.hashCode ^
      otp.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      mobile.hashCode ^
      workStatus.hashCode ^
      acceptTerms.hashCode ^
      roleId.hashCode ^
      pageState.hashCode;
}
