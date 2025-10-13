import 'dart:convert';

class EducationInfoModel {
  final String? degree;
  final String? institution;
  final int? graduationYear;

  EducationInfoModel({
    this.degree,
    this.institution,
    this.graduationYear,
  });

  EducationInfoModel copyWith({
    String? degree,
    String? institution,
    int? graduationYear,
  }) {
    return EducationInfoModel(
      degree: degree ?? this.degree,
      institution: institution ?? this.institution,
      graduationYear: graduationYear ?? this.graduationYear,
    );
  }

  factory EducationInfoModel.fromJson(Map<String, dynamic> json) {
    return EducationInfoModel(
      degree: json['degree'],
      institution: json['institution'],
      graduationYear: json['graduationYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'institution': institution,
      'graduationYear': graduationYear,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
