class DeiRevolutionModel {
  final String id;
  final String? heading;
  final String? description;
  final String? firstButtonLink;
  final String? secondButtonLink;
  final String? backgroundImage;

  DeiRevolutionModel({
    required this.id,
    this.heading,
    this.description,
    this.firstButtonLink,
    this.secondButtonLink,
    this.backgroundImage,
  });

  factory DeiRevolutionModel.fromJson(Map<String, dynamic> json) {
    return DeiRevolutionModel(
      id: json['_id'] as String,
      heading: json['heading'] as String?,
      description: json['description'] as String?,
      firstButtonLink: json['firstButtonLink'] as String?,
      secondButtonLink: json['secondButtonLink'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'heading': heading,
      'description': description,
      'firstButtonLink': firstButtonLink,
      'secondButtonLink': secondButtonLink,
      'backgroundImage': backgroundImage,
    };
  }
}
