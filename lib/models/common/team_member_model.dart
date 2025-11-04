class TeamMemberModel {
  final String? id;
  final String? name;
  final String? role;
  final String? email;
  final String? bio;
  final String? avatar;

  TeamMemberModel({
    this.id,
    this.name,
    this.role,
    this.email,
    this.bio,
    this.avatar,
  });

  // ✅ From JSON
  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      bio: json['bio'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }


  // ✅ Optional helper for list parsing
  static List<TeamMemberModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => TeamMemberModel.fromJson(e)).toList();
  }
}
