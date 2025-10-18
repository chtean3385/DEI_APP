import 'dart:convert';

class ApplicationModel {
  final String? id; // optional unique ID
  final String? profileImage;
  final String? userName;
  final String? userType; // e.g. "Professional", "Student"
  final String? location;
  final DateTime? appliedOn;
  final String? applicationStatus; // e.g. "Rejected", "Accepted", "Pending"
  final bool? isActive;

  const ApplicationModel({
    this.id,
    this.profileImage,
    this.userName,
    this.userType,
    this.location,
    this.appliedOn,
    this.applicationStatus,
    this.isActive,
  });

  /// ✅ Create a new object from JSON map
  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      id: json['_id'] as String?,
      profileImage: json['profileImage'] as String?,
      userName: json['userName'] as String?,
      userType: json['userType'] as String?,
      location: json['location'] as String?,
      appliedOn: json['appliedOn'] != null
          ? DateTime.tryParse(json['appliedOn'])
          : null,
      applicationStatus: json['applicationStatus'] as String?,
      isActive: json['isActive'] as bool?,
    );
  }

  /// ✅ Convert model to JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'profileImage': profileImage,
      'userName': userName,
      'userType': userType,
      'location': location,
      'appliedOn': appliedOn?.toIso8601String(),
      'applicationStatus': applicationStatus,
      'isActive': isActive,
    };
  }

  /// ✅ Optional: clone with changes
  ApplicationModel copyWith({
    String? id,
    String? profileImage,
    String? userName,
    String? userType,
    String? location,
    DateTime? appliedOn,
    String? applicationStatus,
    bool? isActive,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      profileImage: profileImage ?? this.profileImage,
      userName: userName ?? this.userName,
      userType: userType ?? this.userType,
      location: location ?? this.location,
      appliedOn: appliedOn ?? this.appliedOn,
      applicationStatus: applicationStatus ?? this.applicationStatus,
      isActive: isActive ?? this.isActive,
    );
  }

}
