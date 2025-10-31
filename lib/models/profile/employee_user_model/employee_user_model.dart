class EmployeeUserModel {
  final Preferences? preferences;
  final String? id;
  final int? roleId;
  final String? name;
  final String? email;
  final List<String>? skills;
  final bool? status;
  final bool? companyVerified;
  final bool? acceptTerms;
  final List<EducationModel>? education;
  final List<ExperienceModel>? experience;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? memberSince;
  final String? address;
  final String? city;
  final String? country;
  final String? dateOfBirth;
  final String? gender;
  final String? mobile;
  final String? pincode;
  final String? profilePhotoUrl;
  final String? resume;
  final String? state;
  final String? workStatus;
  final List<String>? certifiedTags;
  final String? employeeDescription;

  EmployeeUserModel({
    this.preferences,
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.skills,
    this.status,
    this.companyVerified,
    this.acceptTerms,
    this.education,
    this.experience,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.memberSince,
    this.address,
    this.city,
    this.country,
    this.dateOfBirth,
    this.gender,
    this.mobile,
    this.pincode,
    this.profilePhotoUrl,
    this.resume,
    this.state,
    this.workStatus,
    this.certifiedTags,
    this.employeeDescription,
  });

  factory EmployeeUserModel.fromJson(Map<String, dynamic> json) => EmployeeUserModel(
    preferences: json['preferences'] != null
        ? Preferences.fromJson(json['preferences'])
        : null,
    id: json['_id'],
    roleId: json['roleId'],
    name: json['name'],
    email: json['email'],
    skills: json['skills'] != null
        ? List<String>.from(json['skills'])
        : [],
    status: json['status'],
    companyVerified: json['companyVerified'],
    acceptTerms: json['acceptTerms'],
    education: json['education'] != null
        ? List<EducationModel>.from(
        json['education'].map((e) => EducationModel.fromJson(e)))
        : [],
    experience: json['experience'] != null
        ? List<ExperienceModel>.from(
        json['experience'].map((e) => ExperienceModel.fromJson(e)))
        : [],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    v: json['__v'],
    memberSince: json['memberSince'],
    address: json['address'],
    city: json['city'],
    country: json['country'],
    dateOfBirth: json['dateOfBirth'],
    gender: json['gender'],
    mobile: json['mobile'],
    pincode: json['pincode'],
    profilePhotoUrl: json['profilePhotoUrl'],
    resume: json['resume'],
    state: json['state'],
    workStatus: json['workStatus'],
    certifiedTags: json['certifiedTags'] != null
        ? List<String>.from(json['certifiedTags'])
        : [],
    employeeDescription: json['employeeDescription'],
  );

  Map<String, dynamic> toJson() => {
    'preferences': preferences?.toJson(),
    '_id': id,
    'roleId': roleId,
    'name': name,
    'email': email,
    'skills': skills,
    'status': status,
    'companyVerified': companyVerified,
    'acceptTerms': acceptTerms,
    'education': education?.map((e) => e.toJson()).toList(),
    'experience': experience?.map((e) => e.toJson()).toList(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
    'memberSince': memberSince,
    'address': address,
    'city': city,
    'country': country,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'mobile': mobile,
    'pincode': pincode,
    'profilePhotoUrl': profilePhotoUrl,
    'resume': resume,
    'state': state,
    'workStatus': workStatus,
    'certifiedTags': certifiedTags,
    'employeeDescription': employeeDescription,
  };

  /// ✅ CopyWith method
  EmployeeUserModel copyWith({
    Preferences? preferences,
    String? id,
    int? roleId,
    String? name,
    String? email,
    List<String>? skills,
    bool? status,
    bool? companyVerified,
    bool? acceptTerms,
    List<EducationModel>? education,
    List<ExperienceModel>? experience,
    String? createdAt,
    String? updatedAt,
    int? v,
    String? memberSince,
    String? address,
    String? city,
    String? country,
    String? dateOfBirth,
    String? gender,
    String? mobile,
    String? pincode,
    String? profilePhotoUrl,
    String? resume,
    String? state,
    String? workStatus,
    List<String>? certifiedTags,
    String? employeeDescription,
  }) {
    return EmployeeUserModel(
      preferences: preferences ?? this.preferences,
      id: id ?? this.id,
      roleId: roleId ?? this.roleId,
      name: name ?? this.name,
      email: email ?? this.email,
      skills: skills ?? this.skills,
      status: status ?? this.status,
      companyVerified: companyVerified ?? this.companyVerified,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      memberSince: memberSince ?? this.memberSince,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      mobile: mobile ?? this.mobile,
      pincode: pincode ?? this.pincode,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      resume: resume ?? this.resume,
      state: state ?? this.state,
      workStatus: workStatus ?? this.workStatus,
      certifiedTags: certifiedTags ?? this.certifiedTags,
      employeeDescription: employeeDescription ?? this.employeeDescription,
    );
  }
}


class Preferences {
  final List<String>? jobTypes;
  final String? salaryRange;
  final List<String>? department;
  final List<String>? preferredLocations;

  Preferences({
    this.jobTypes,
    this.salaryRange,
    this.department,
    this.preferredLocations,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    jobTypes: json['jobTypes'] != null
        ? List<String>.from(json['jobTypes'])
        : [],
    salaryRange: json['salary_range'],
    department: json['department'] != null
        ? List<String>.from(json['department'])
        : [],
    preferredLocations: json['preffered_locations'] != null
        ? List<String>.from(json['preffered_locations'])
        : [],
  );

  Map<String, dynamic> toJson() => {
    'jobTypes': jobTypes,
    'salary_range': salaryRange,
    'department': department,
    'preffered_locations': preferredLocations,
  };
}

class EducationModel {
  final String? degree;
  final String? institution;
  final int? graduationYear;
  final String? id;

  EducationModel({
    this.degree,
    this.institution,
    this.graduationYear,
    this.id,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
    degree: json['degree'],
    institution: json['institution'],
    graduationYear: json['graduationYear'],
    id: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    'degree': degree,
    'institution': institution,
    'graduationYear': graduationYear,
    '_id': id,
  };
}

class ExperienceModel {
  final String? companyName;
  final String? position;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final String? id;
  final bool? isCurrentlyWorking;

  ExperienceModel({
    this.companyName,
    this.position,
    this.startDate,
    this.endDate,
    this.description,
    this.id,
    this.isCurrentlyWorking,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
    companyName: json['companyName'],
    position: json['position'],
    startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
    endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
    isCurrentlyWorking: json['isCurrentlyWorking'] ?? false,
    description: json['description'],
    id: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    'companyName': companyName,
    'position': position,
    'startDate': startDate,
    'endDate': endDate,
    'description': description,
    '_id': id,
  };

  ExperienceModel copyWith({
    String? companyName,
    String? position,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCurrentlyWorking,
    String? description,
  }) {
    return ExperienceModel(
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrentlyWorking: isCurrentlyWorking ?? this.isCurrentlyWorking,
      description: description ?? this.description,
    );
  }
}
