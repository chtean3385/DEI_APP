class AboutVisionModel {
  final String? id;
  final String? missionTitle;
  final String? missionDescription;
  final String? visionTitle;
  final String? visionDescription;

  AboutVisionModel({
    this.id,
    this.missionTitle,
    this.missionDescription,
    this.visionTitle,
    this.visionDescription,
  });

  factory AboutVisionModel.fromJson(Map<String, dynamic> json) {
    return AboutVisionModel(
      id: json['_id'] as String?,
      missionTitle: json['missionTitle'] as String?,
      missionDescription: json['missionDescription'] as String?,
      visionTitle: json['visionTitle'] as String?,
      visionDescription: json['visionDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'missionTitle': missionTitle,
      'missionDescription': missionDescription,
      'visionTitle': visionTitle,
      'visionDescription': visionDescription,
    };
  }
}
