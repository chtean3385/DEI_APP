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
