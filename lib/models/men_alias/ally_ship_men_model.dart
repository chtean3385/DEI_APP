class AllyShipMenModel {
  final String id;
  final String? firstParagraph;
  final String? secondParagraph;
  final String? backgroundImage;

  AllyShipMenModel({
    required this.id,
    this.firstParagraph,
    this.secondParagraph,
    this.backgroundImage,
  });

  // Factory method to create an instance from JSON
  factory AllyShipMenModel.fromJson(Map<String, dynamic> json) {
    return AllyShipMenModel(
      id: json['_id'] as String,
      firstParagraph: json['firstParagraph'] as String?,
      secondParagraph: json['secondParagraph'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstParagraph': firstParagraph,
      'secondParagraph': secondParagraph,
      'backgroundImage': backgroundImage,
    };
  }
}
