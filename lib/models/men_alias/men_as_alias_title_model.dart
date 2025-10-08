class MenAsAlliesTitleModel {
  final String id;
  final String? backgroundImage;
  final String? pill;
  final String? title;
  final String? subtitle;

  MenAsAlliesTitleModel({
    required this.id,
    this.backgroundImage,
    this.pill,
    this.title,
    this.subtitle,
  });

  factory MenAsAlliesTitleModel.fromJson(Map<String, dynamic> json) {
    return MenAsAlliesTitleModel(
      id: json['_id'] as String,
      backgroundImage: json['backgroundImage'] as String?,
      pill: json['pill'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'backgroundImage': backgroundImage,
      'pill': pill,
      'title': title,
      'subtitle': subtitle,
    };
  }
}