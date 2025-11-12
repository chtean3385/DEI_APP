class CandidateListModel {
  final String? id;
  final String? heading;
  final String? subheading;
  final List<UserModel>? users;

  CandidateListModel({this.id, this.heading, this.subheading, this.users});

  factory CandidateListModel.fromJson(Map<String, dynamic> json) {
    return CandidateListModel(
      id: json["_id"] as String?,
      heading: json["heading"] as String?,
      subheading: json["subheading"] as String?,
      users: (json["users"] as List<dynamic>?)
          ?.map((u) => UserModel.fromJson(u as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "heading": heading,
      "subheading": subheading,
      "users": users?.map((u) => u.toJson()).toList(),
    };
  }
}

class UserModel {
  final String? name;
  final String? email;
  final List<String>? skills;
  final bool? status;
  final String? city;
  final String? country;
  final String? mobile;
  final String? profilePhotoUrl;
  final String? state;
  final String? workStatus;
  final String? companyName;
  final String? position;
  final String? salary;
  final String? jobType;
  final DateTime? createdAt;

  UserModel({
    this.name,
    this.email,
    this.skills,
    this.status,
    this.city,
    this.country,
    this.mobile,
    this.profilePhotoUrl,
    this.state,
    this.workStatus,
    this.companyName,
    this.position,
    this.salary,
    this.jobType,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final experience = json["experience"] as List<dynamic>?;

    return UserModel(
      name: json["name"] as String?,
      email: json["email"] as String?,
      skills: (json["skills"] as List<dynamic>?)
          ?.map((s) => s.toString())
          .toList(),
      status: json["status"] as bool?,
      city: json["city"] as String?,
      country: json["country"] as String?,
      mobile: json["mobile"] as String?,
      profilePhotoUrl: json["profilePhotoUrl"] as String?,
      state: json["state"] as String?,
      workStatus: json["workStatus"] as String?,
      companyName: (experience != null && experience.isNotEmpty)
          ? experience.first["companyName"] as String?
          : null,
      position: (experience != null && experience.isNotEmpty)
          ? experience.first["position"] as String?
          : null,
      salary: json["preferences"] != null ? json["preferences"]["salary_range"] : null,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "skills": skills,
      "status": status,
      "city": city,
      "country": country,
      "mobile": mobile,
      "profilePhotoUrl": profilePhotoUrl,
      "state": state,
      "workStatus": workStatus,
      "companyName": companyName,
      "position": position,
    };
  }
}
