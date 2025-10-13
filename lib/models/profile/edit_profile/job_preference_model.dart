import 'dart:convert';

class JobPreferenceModel {
  final String? jobType;
  final String? salaryRange;
  final List<String>? preferredLocations;

  JobPreferenceModel({
    this.jobType,
    this.salaryRange,
    this.preferredLocations,
  });

  JobPreferenceModel copyWith({
    String? jobType,
    String? salaryRange,
    List<String>? preferredLocations,
  }) {
    return JobPreferenceModel(
      jobType: jobType ?? this.jobType,
      salaryRange: salaryRange ?? this.salaryRange,
      preferredLocations: preferredLocations ?? this.preferredLocations,
    );
  }

  factory JobPreferenceModel.fromJson(Map<String, dynamic> json) {
    return JobPreferenceModel(
      jobType: json['jobType'],
      salaryRange: json['salaryRange'],
      preferredLocations: json['preferredLocations'] != null
          ? List<String>.from(json['preferredLocations'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobType': jobType,
      'salaryRange': salaryRange,
      'preferredLocations': preferredLocations,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
