
class ProfileCompletionModel {
  final String? userId;
  final int? profileCompletion;
  final int? totalFields;
  final int? completedFields;
  final int? missingFieldsCount;
  final List<MissingField>? missingFields;

  ProfileCompletionModel({
    this.userId,
    this.profileCompletion,
    this.totalFields,
    this.completedFields,
    this.missingFieldsCount,
    this.missingFields,
  });

  factory ProfileCompletionModel.fromJson(Map<String, dynamic> json) {
    return ProfileCompletionModel(
      userId: json['userId'] as String?,
      profileCompletion: json['profileCompletion'] as int?,
      totalFields: json['totalFields'] as int?,
      completedFields: json['completedFields'] as int?,
      missingFieldsCount: json['missingFieldsCount'] as int?,
      missingFields: json['missingFields'] != null
          ? (json['missingFields'] as List)
          .map((e) => MissingField.fromJson(e))
          .toList()
          : null,
    );
  }

}

class MissingField {
  final String? field;
  final String? displayName;
  final int? percentage;

  MissingField({
    this.field,
    this.displayName,
    this.percentage,
  });

  factory MissingField.fromJson(Map<String, dynamic> json) {
    return MissingField(
      field: json['field'] as String?,
      displayName: json['displayName'] as String?,
      percentage: json['percentage'] as int?,
    );
  }

}
