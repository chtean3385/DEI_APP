class JobModelApi {
  String? id;
  String? title;
  String? description;
  String? city;
  String? state;
  String? country;
  String? salary;
  String? category;
  String? jobType;
  String? status;
  String? myStatus;
  Employer? employer;
  List<String>? skills;
  List<Applicant>? applicants;
  List<SavedUser>? savedUsers;
  bool? isApproved;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isApplied = false;
  bool isSaved = false;

  JobModelApi({
    this.id,
    this.title,
    this.description,
    this.city,
    this.state,
    this.country,
    this.salary,
    this.category,
    this.jobType,
    this.status,
    this.myStatus,
    this.employer,
    this.skills,
    this.applicants,
    this.savedUsers,
    this.isApproved,
    this.createdAt,
    this.updatedAt,
    this.isApplied = false,
    this.isSaved = false,
  });

  factory JobModelApi.fromJson(
    Map<String, dynamic> json, {
    String? currentUserId,
  }) {
    final applicantsList = json["applicants"] == null
        ? <Applicant>[]
        : List<Applicant>.from(
            json["applicants"].map((x) => Applicant.fromJson(x)),
          );

    final savedUsersList = json["savedBy"] == null
        ? <SavedUser>[]
        : List<SavedUser>.from(
            json["savedBy"].map((x) => SavedUser.fromJson(x)),
          );

    // 🔹 Check if user has applied/saved
    final hasApplied =
        currentUserId != null &&
        applicantsList.any((app) => app.id == currentUserId);

    final hasSaved =
        currentUserId != null &&
        savedUsersList.any((saved) => saved.id == currentUserId);
    return JobModelApi(
      id: json["_id"],
      title: json["jobTitle"],
      description: json["jobDescription"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      salary: json["salary"] != null ? json["salary"]["range"] : null,
      status: json["status"],
      myStatus: json["myStatus"],
      jobType: json["jobType"] != null ? json["jobType"]["name"] : null,
      category: json["category"] != null ? json["category"]["title"] : null,
      employer: json["postedBy"] != null
          ? Employer.fromJson(json["postedBy"])
          : null,
      skills: json["tags"] != null ? List<String>.from(json["tags"]) : [],
      // isApproved: json["isApproved"],
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
      isApplied: hasApplied,
      isSaved: hasSaved,
    );
  }

  factory JobModelApi.fromJsonRecommendedJobs(
      Map<String, dynamic> json, {
        String? currentUserId,
      }) {
    final applicantsList = (json["applicants"] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];

    final savedUsersList = (json["savedBy"] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];

    // 🔹 Check if user has applied/saved
    final hasApplied =
        currentUserId != null && applicantsList.contains(currentUserId);
    final hasSaved =
        currentUserId != null && savedUsersList.contains(currentUserId);
    return JobModelApi(
      id: json["_id"],
      title: json["jobTitle"],
      description: json["jobDescription"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      salary: json["salary"] != null ? json["salary"]["range"] : null,
      status: json["status"],
      myStatus: json["myStatus"],
      jobType: json["jobType"] != null ? json["jobType"]["name"] : null,
      category: json["category"] != null ? json["category"]["title"] : null,
      employer: json["postedBy"] != null
          ? Employer.fromJson(json["postedBy"])
          : null,
      skills: json["tags"] != null ? List<String>.from(json["tags"]) : [],
      // isApproved: json["isApproved"],
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
      isApplied: hasApplied,
      isSaved: hasSaved,
    );
  }

  factory  JobModelApi.fromJsonSimilarJobs(
      Map<String, dynamic> json, {
        String? currentUserId,
      }) {

    final applicantsList = (json["applicants"] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];

    final savedUsersList = (json["savedBy"] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];

    // 🔹 Check if current user has applied or saved
    final hasApplied =
        currentUserId != null && applicantsList.contains(currentUserId);
    final hasSaved =
        currentUserId != null && savedUsersList.contains(currentUserId);

    return JobModelApi(
      id: json["_id"] ?? '',
      title: json["jobTitle"] ?? '',
      description: json["jobDescription"] ?? '',
      city: json["city"] ?? '',
      state: json["state"] ?? '',
      country: json["country"] ?? '',
      salary: json["salary"] ?? '',
      status: json["status"] ?? '',
      jobType: json["jobType"] != null ? json["jobType"]["name"] : null,
      category: json["category"] != null ? json["category"]["title"] : null,
      // department: json["department"] != null
      //     ? json["department"]["name"]
      //     : null,
      // employerId: json["postedBy"] ?? '', // string ID only
      skills: (json["tags"] as List?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      // isApproved: json["isApproved"],
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
      isApplied: hasApplied,
      isSaved: hasSaved,
    );
  }


  JobModelApi copyWith({
    String? id,
    String? title,
    String? description,
    String? city,
    String? state,
    String? country,
    String? salary,
    String? category,
    String? jobType,
    String? status,
    String? myStatus,
    Employer? employer,
    List<String>? skills,
    List<Applicant>? applicants,
    List<SavedUser>? savedUsers,
    bool? isApproved,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isApplied,
    bool? isSaved,
  }) {
    return JobModelApi(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      salary: salary ?? this.salary,
      category: category ?? this.category,
      jobType: jobType ?? this.jobType,
      status: status ?? this.status,
      myStatus: myStatus ?? this.myStatus,
      employer: employer ?? this.employer,
      skills: skills ?? this.skills,
      applicants: applicants ?? this.applicants,
      savedUsers: savedUsers ?? this.savedUsers,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isApplied: isApplied ?? this.isApplied,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}

class Employer {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? company;
  String? companyLogo;
  String? companyWebsite;
  String? address;
  String? city;
  String? state;
  String? pincode;
  DateTime? memberSince;
  bool? companyVerified;
  String? companySize;
  String? companyDesignation;
  List<CertifiedTag>? certifiedTags;
  List<CompanyGallery>? companyGallery;

  Employer({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.company,
    this.companyLogo,
    this.companyWebsite,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.memberSince,
    this.companyVerified,
    this.companySize,
    this.companyDesignation,
    this.certifiedTags,
    this.companyGallery,
  });

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      phone: json["mobile"],
      company: json["companyName"],
      companyLogo: json["profilePhotoUrl"],
      companyWebsite: json["companyWebsite"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      pincode: json["pincode"],
      memberSince: json["memberSince"] != null
          ? DateTime.tryParse(json["memberSince"])
          : null,
      companyVerified: json["companyVerified"],
      companySize: json["companySize"],
      companyDesignation: json["companyDesignation"],
      certifiedTags: json["certifiedTags"] != null
          ? (json["certifiedTags"] as List)
                .map((e) => CertifiedTag.fromJson(e))
                .toList()
          : [],
      companyGallery: (json["companyGallery"] as List?)
          ?.map((e) => CompanyGallery.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": phone,
    "companyName": company,
    "profilePhotoUrl": companyLogo,
    "companyWebsite": companyWebsite,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "memberSince": memberSince,
    "companyVerified": companyVerified,
    "companySize": companySize,
    "companyDesignation": companyDesignation,
  };
}

class Applicant {
  String? id;
  String? name;
  String? email;
  String? resumeUrl;
  DateTime? appliedAt;

  Applicant({this.id, this.name, this.email, this.resumeUrl, this.appliedAt});

  factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    resumeUrl: json["resumeUrl"],
    appliedAt: json["appliedAt"] != null
        ? DateTime.tryParse(json["appliedAt"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "resumeUrl": resumeUrl,
    "appliedAt": appliedAt?.toIso8601String(),
  };
}

class SavedUser {
  String? id;
  DateTime? savedAt;

  SavedUser({this.id, this.savedAt});

  factory SavedUser.fromJson(Map<String, dynamic> json) => SavedUser(
    id: json["_id"],
    savedAt: json["savedAt"] != null
        ? DateTime.tryParse(json["savedAt"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "savedAt": savedAt?.toIso8601String(),
  };
}

/// ✅ Sub-model for Certified Tags
class CertifiedTag {
  String? id;
  String? name;
  String? image;
  String? status;

  CertifiedTag({this.id, this.name, this.image, this.status});

  factory CertifiedTag.fromJson(Map<String, dynamic> json) => CertifiedTag(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "status": status,
  };
}

class CompanyGallery {
  String? id;
  String? imageUrl;

  CompanyGallery({this.id, this.imageUrl});

  factory CompanyGallery.fromJson(Map<String, dynamic> json) =>
      CompanyGallery(id: json["_id"], imageUrl: json["imageUrl"]);
}
