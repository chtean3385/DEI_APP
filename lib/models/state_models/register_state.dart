import '../../constants/enums.dart';

class RegisterState {
  final String? name;
  final String? email;
  final String? password;
  final String? mobile;
  final String? workStatus;
  final bool? acceptTerms;
  final int? roleId;
  final String? userId;

  final PageState pageState;

  const RegisterState({
    this.name,
    this.email,
    this.password,
    this.mobile,
    this.workStatus,
    this.acceptTerms,
    this.roleId,
    this.userId,
    this.pageState = PageState.initial,
  });

  RegisterState copyWith({
    bool? isOtpValid,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? workStatus,
    String? userId,
    bool? acceptTerms,
    int? roleId,
    PageState? pageState,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      workStatus: workStatus ?? this.workStatus,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      roleId: roleId ?? this.roleId,
      pageState: pageState ?? this.pageState,
      userId: userId ?? this.userId,
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
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      mobile.hashCode ^
      workStatus.hashCode ^
      acceptTerms.hashCode ^
      roleId.hashCode ^
      pageState.hashCode;
}
class EmployerRegisterState {
  final String? name;
  final String? email;
  final String? password;
  final String? mobile;
  final bool? companyAccountType;
  final String? companyName;
  final String? companyEmail;
  final String? companyDesignation;
  final String? companySize;
  final String? companyWebsite;
  final String? address;
  final String? city;
  final String? state;
  final String? pinCode;
  final bool? acceptTerms;
  final int? roleId;

  final PageState pageState;

  const EmployerRegisterState({
    this.name,
    this.email,
    this.password,
    this.mobile,
    this.companyAccountType,
    this.companyName,
    this.companyEmail,
    this.companyDesignation,
    this.companySize,
    this.companyWebsite,
    this.address,
    this.city,
    this.state,
    this.pinCode,
    this.acceptTerms,
    this.roleId,
    this.pageState = PageState.initial,
  });

  EmployerRegisterState copyWith({
    bool? isOtpValid,
    String? otp,
    String? name,
    String? email,
    String? password,
    String? mobile,
    bool? companyAccountType,
    String? companyName,
    String? companyEmail,
    String? companyDesignation,
    String? companySize,
    String? companyWebsite,
    String? address,
    String? city,
    String? state,
    String? pinCode,
    bool? acceptTerms,
    int? roleId,
    PageState? pageState,
  }) {
    return EmployerRegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      companyAccountType: companyAccountType ?? this.companyAccountType,
      companyName: companyName ?? this.companyName,
      companyEmail: companyEmail ?? this.companyEmail,
      companyDesignation: companyDesignation ?? this.companyDesignation,
      companySize: companySize ?? this.companySize,
      companyWebsite: companyWebsite ?? this.companyWebsite,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      roleId: roleId ?? this.roleId,
      pageState: pageState ?? this.pageState,
    );
  }

}
