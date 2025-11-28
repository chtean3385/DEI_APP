
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
  final List<JobTypeModel>? jobType;
  final String? department;
  final String? category;
  final SalaryRangeModel? salaryRange;
  final List<String>? preferredLocations;
  /// NEW FIELDS
  final String? currentSalary;
  final List<IndustryModel>? industry;
  final List<DepartmentModel>? currentDepartment;
  final String? noticePeriod;
  final String? totalWorkExperience;
  final String? departmentId;
  final String? industryId;
  final String? salaryId;
  final String? jobTypeId;



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
    this.jobType,
    this.department,
    this.category,
    this.salaryRange,
    this.preferredLocations,
    this.currentSalary,
    this.industry,
    this.currentDepartment,
    this.noticePeriod,
    this.totalWorkExperience,
    this.departmentId,
    this.industryId,
    this.salaryId,
    this.jobTypeId,
  });

  factory EmployeeUserModel.fromJson(Map<String, dynamic> json) => EmployeeUserModel(
    preferences: json['preferences'] != null
        ? Preferences.fromJson(json['preferences'])
        : null,
    department: json['preferences']?['department'] != null &&
        (json['preferences']['department'] as List).isNotEmpty
        ? (json['preferences']['department'][0]['name'])
        : null,
    preferredLocations: json['preferences']?['preffered_locations'] != null
        ? List<String>.from(json['preferences']['preffered_locations'])
        : [],
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
    /// NEW FIELDS
    currentSalary: json['currentSalary'],
    industry: json['industry'] != null
        ? List<IndustryModel>.from(
        json['industry'].map((e) => IndustryModel.fromJson(e)))
        : [],
    currentDepartment: json['department'] != null
        ? List<DepartmentModel>.from(
        json['department'].map((e) => DepartmentModel.fromJson(e)))
        : [],
    jobType: json['preferences']?['jobTypes'] != null
        ? List<JobTypeModel>.from(
      json['preferences']['jobTypes']
          .map((e) => JobTypeModel.fromJson(e)),
    )
        : [],

    salaryRange: json['preferences']?['salary_range'] != null
        ? SalaryRangeModel.fromJson(json['preferences']['salary_range'])
        : null,

    noticePeriod: json['noticePeriod'],
    totalWorkExperience: json['totalWorkExperience'],


  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'mobile': mobile,
    'dateOfBirth': dateOfBirth,
    'employeeDescription': employeeDescription,
    'gender': gender,
    'workStatus': workStatus,
    'address': address,
    'city': city,
    'state': state,
    'country': country,
    'pincode': pincode,
    'category': category,
    'preferredLocations': preferredLocations,
    'education': education?.map((e) => e.toJson()).toList(),
    'experience': experience?.map((e) => e.toJson()).toList(),
    'skills': skills,
    'totalWorkExperience': totalWorkExperience,
    'noticePeriod': noticePeriod,
    'currentSalary': currentSalary,
    if(departmentId?.isNotEmpty == true)'departments': [departmentId],
    if(industryId?.isNotEmpty == true)'industries': [industryId],
    'jobType': jobTypeId,
    'salaryRange': salaryId,
    'preferences': {
      "preffered_locations": preferredLocations ?? [],
    }
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
    List<JobTypeModel>? jobType,
    String? department,
    String? category,
    SalaryRangeModel? salaryRange,
    List<String>? preferredLocations,
    /// NEW FIELDS
    String? currentSalary,
    List<IndustryModel>? industry,
    List<DepartmentModel>? currentDepartment,
    String? noticePeriod,
    String? totalWorkExperience,
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
      jobType: jobType ?? this.jobType,
      department: department ?? this.department,
      category: category ?? this.category,
      salaryRange: salaryRange ?? this.salaryRange,
      preferredLocations: preferredLocations ?? this.preferredLocations,
      /// NEW FIELDS
      currentSalary: currentSalary ?? this.currentSalary,
      industry: industry ?? this.industry,
      currentDepartment: currentDepartment ?? this.currentDepartment,
      noticePeriod: noticePeriod ?? this.noticePeriod,
      totalWorkExperience: totalWorkExperience ?? this.totalWorkExperience,

    );
  }
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
    'graduationYear': graduationYear.toString(),
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
    'startDate': startDate.toString(),
    'endDate': endDate.toString(),
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
class JobTypeModel {
  final String? id;
  final String? name;

  JobTypeModel({this.id, this.name});

  factory JobTypeModel.fromJson(Map<String, dynamic> json) =>
      JobTypeModel(id: json['_id'], name: json['name']);
}
class DepartmentModel {
  final String? id;
  final String? name;

  DepartmentModel({this.id, this.name});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(id: json['_id'], name: json['name']);
}

class SalaryRangeModel {
  final String? id;
  final String? range;

  SalaryRangeModel({this.id, this.range});

  factory SalaryRangeModel.fromJson(Map<String, dynamic> json) =>
      SalaryRangeModel(id: json['_id'], range: json['range']);
}
class Preferences {
  final List<JobTypeModel>? jobTypes;
  final SalaryRangeModel? salaryRange;
  final List<DepartmentModel>? department;
  final List<String>? preferredLocations;

  Preferences({
    this.jobTypes,
    this.salaryRange,
    this.department,
    this.preferredLocations,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    jobTypes: json['jobTypes'] != null
        ? List<JobTypeModel>.from(
        json['jobTypes'].map((e) => JobTypeModel.fromJson(e)))
        : [],
    salaryRange: json['salary_range'] != null
        ? SalaryRangeModel.fromJson(json['salary_range'])
        : null,
    department: json['department'] != null
        ? List<DepartmentModel>.from(
        json['department'].map((e) => DepartmentModel.fromJson(e)))
        : [],
    preferredLocations: json['preffered_locations'] != null
        ? List<String>.from(json['preffered_locations'])
        : [],
  );

  Map<String, dynamic> toJson() => {
    'jobTypes': jobTypes?.map((e) => {'_id': e.id, 'name': e.name}).toList(),
    'salary_range': salaryRange != null
        ? {'_id': salaryRange!.id, 'range': salaryRange!.range}
        : null,
    'department': department?.map((e) => {'_id': e.id, 'name': e.name}).toList(),
    'preffered_locations': preferredLocations,
  };
}
class IndustryModel {
  final String? id;
  final String? title;
  final String? image;
  final String? desc;
  final String? status;

  IndustryModel({
    this.id,
    this.title,
    this.image,
    this.desc,
    this.status,
  });

  factory IndustryModel.fromJson(Map<String, dynamic> json) => IndustryModel(
    id: json['_id'],
    title: json['title'],
    image: json['image'],
    desc: json['desc'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "image": image,
    "desc": desc,
    "status": status,
  };
}

