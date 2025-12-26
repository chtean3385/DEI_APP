class AuthModel {
  final String token;
  final String userId;
  final String resumeUrl;
  final int roleId;

  AuthModel({required this.token, required this.userId,required this.roleId,required this.resumeUrl});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['serviceToken']?.toString() ?? '',
      userId: json['user']['_id']?.toString() ?? '',
      roleId: json['user']['roleId'] ?? 0,
      resumeUrl: json['user']['resume'] ?? "",
    );
  }
}
class OtpPendingUserModel {
  final String? userId;
  final String? email;
  final String? mobile;
  final int? roleId;
  final bool? isActive;
  final bool? requiresOtpVerification;

  OtpPendingUserModel({
    this.userId,
    this.email,
    this.mobile,
    this.roleId,
    this.isActive,
    this.requiresOtpVerification,
  });

  factory OtpPendingUserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return OtpPendingUserModel();

    return OtpPendingUserModel(
      userId: json['userId']?.toString(),
      email: json['email']?.toString(),
      mobile: json['mobile']?.toString(),
      roleId: json['roleId'] is int
          ? json['roleId']
          : int.tryParse(json['roleId']?.toString() ?? ''),
      isActive: json['isActive'] as bool?,
      requiresOtpVerification:
      json['requiresOtpVerification'] as bool?,
    );
  }
}
