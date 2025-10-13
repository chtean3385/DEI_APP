class BasicProfileDetailsModel {
  final String fullName;
  final String emailAddress;
  final String mobileNumber;
  final DateTime dateOfBirth;
  final String gender;
  final String workStatus;
  final String description;
  final bool isActive;
  final bool isEmployed;
  final String? profileImageUrl;

  BasicProfileDetailsModel({
    required this.fullName,
    required this.emailAddress,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.workStatus,
    required this.description,
    required this.isActive,
    required this.isEmployed,
    this.profileImageUrl,
  });

  // Convert from JSON
  factory BasicProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    return BasicProfileDetailsModel(
      fullName: json['fullName'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      dateOfBirth: DateTime.tryParse(json['dateOfBirth'] ?? '') ?? DateTime(2000, 1, 1),
      gender: json['gender'] ?? '',
      workStatus: json['workStatus'] ?? '',
      description: json['description'] ?? '',
      isActive: json['isActive'] ?? false,
      isEmployed: json['isEmployed'] ?? false,
      profileImageUrl: json['profileImageUrl'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'emailAddress': emailAddress,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'workStatus': workStatus,
      'description': description,
      'isActive': isActive,
      'isEmployed': isEmployed,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Copy with method
  BasicProfileDetailsModel copyWith({
    String? fullName,
    String? emailAddress,
    String? mobileNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? workStatus,
    String? description,
    bool? isActive,
    bool? isEmployed,
    String? profileImageUrl,
  }) {
    return BasicProfileDetailsModel(
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      workStatus: workStatus ?? this.workStatus,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      isEmployed: isEmployed ?? this.isEmployed,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
