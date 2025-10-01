class AuthModel {
  final String token;
  final String userId;

  AuthModel({required this.token, required this.userId});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['serviceToken']?.toString() ?? '',
      userId: json['user']['_id']?.toString() ?? '',
    );
  }
}
