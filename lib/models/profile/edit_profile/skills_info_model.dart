class SkillsInfoModel {
  final List<String> skills;

  SkillsInfoModel({required this.skills});

  // Convert from JSON
  factory SkillsInfoModel.fromJson(Map<String, dynamic> json) {
    return SkillsInfoModel(
      skills: List<String>.from(json['skills'] ?? []),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'skills': skills,
    };
  }

  // Copy with method
  SkillsInfoModel copyWith({List<String>? skills}) {
    return SkillsInfoModel(
      skills: skills ?? this.skills,
    );
  }
}
