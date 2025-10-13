import 'dart:convert';

class WorkExperienceInfoModel {
  final String? companyName;
  final String? position;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isCurrentlyWorking;
  final String? description;

  WorkExperienceInfoModel({
    this.companyName,
    this.position,
    this.startDate,
    this.endDate,
    this.isCurrentlyWorking,
    this.description,
  });

  WorkExperienceInfoModel copyWith({
    String? companyName,
    String? position,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCurrentlyWorking,
    String? description,
  }) {
    return WorkExperienceInfoModel(
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrentlyWorking: isCurrentlyWorking ?? this.isCurrentlyWorking,
      description: description ?? this.description,
    );
  }

  factory WorkExperienceInfoModel.fromJson(Map<String, dynamic> json) {
    return WorkExperienceInfoModel(
      companyName: json['companyName'],
      position: json['position'],
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      isCurrentlyWorking: json['isCurrentlyWorking'] ?? false,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'position': position,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'isCurrentlyWorking': isCurrentlyWorking,
      'description': description,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
