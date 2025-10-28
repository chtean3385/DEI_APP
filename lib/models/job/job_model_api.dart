

class JobModelApi {
  String? id;
  String? title;
  String? description;
  String? city;
  String? state;
  String? salary;
  String? jobType;
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
    this.salary,
    this.jobType,
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

  factory JobModelApi.fromJson(Map<String, dynamic> json,{String? currentUserId}) {
    final applicantsList = json["applicants"] == null
        ? <Applicant>[]
        : List<Applicant>.from(
        json["applicants"].map((x) => Applicant.fromJson(x)));

    final savedUsersList = json["savedBy"] == null
        ? <SavedUser>[]
        : List<SavedUser>.from(
        json["savedBy"].map((x) => SavedUser.fromJson(x)));

    // 🔹 Check if user has applied/saved
    final hasApplied = currentUserId != null &&
        applicantsList.any((app) => app.id == currentUserId);

    final hasSaved = currentUserId != null &&
        savedUsersList.any((saved) => saved.userId == currentUserId);
    return JobModelApi(
      id: json["_id"],
      title: json["jobTitle"],
      description: json["jobDescription"],
      city: json["city"],
     state: json["state"],
      salary: json["salary"],
     jobType: json["jobType"] != null ? json["jobType"]["name"] : null,
     employer: json["postedBy"] != null
          ? Employer.fromJson(json["postedBy"])
          : null,
     skills: json["tags"] != null
         ? List<String>.from(json["tags"])
         : [],
      // isApproved: json["isApproved"],
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
     isApplied: hasApplied,
     isSaved: hasSaved,

    );
  }

}

class Employer {
  String? id;
  String? name;
  String? email;
  String? company;
  String? companyLogo;
  String? phone;

  Employer({
    this.id,
    this.name,
    this.email,
    this.company,
    this.companyLogo,
    this.phone,
  });

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    company: json["companyName"],
    companyLogo: json["profilePhotoUrl"],
    phone: json["mobile"],
  );

}

class Applicant {
  String? id;
  String? name;
  String? email;
  String? resumeUrl;
  DateTime? appliedAt;

  Applicant({
    this.id,
    this.name,
    this.email,
    this.resumeUrl,
    this.appliedAt,
  });

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
  String? userId;
  DateTime? savedAt;

  SavedUser({
    this.id,
    this.userId,
    this.savedAt,
  });

  factory SavedUser.fromJson(Map<String, dynamic> json) => SavedUser(
    id: json["_id"],
    userId: json["userId"],
    savedAt: json["savedAt"] != null
        ? DateTime.tryParse(json["savedAt"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "savedAt": savedAt?.toIso8601String(),
  };
}
