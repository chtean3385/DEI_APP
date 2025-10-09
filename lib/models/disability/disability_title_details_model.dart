class DisabilityTitleDetailsModel {
  final String? id;
  final String? title;
  final String? paragraph;
  final String? primaryBtnText;
  final String? primaryBtnLink;
  final String? secondaryBtnText;
  final String? secondaryBtnLink;
  final String? backgroundImage;

  DisabilityTitleDetailsModel({
    this.id,
    this.title,
    this.paragraph,
    this.primaryBtnText,
    this.primaryBtnLink,
    this.secondaryBtnText,
    this.secondaryBtnLink,
    this.backgroundImage,
  });

  factory DisabilityTitleDetailsModel.fromJson(Map<String, dynamic> json) {
    return DisabilityTitleDetailsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      paragraph: json['paragraph'] as String?,
      primaryBtnText: json['primaryBtnText'] as String?,
      primaryBtnLink: json['primaryBtnLink'] as String?,
      secondaryBtnText: json['secondaryBtnText'] as String?,
      secondaryBtnLink: json['secondaryBtnLink'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'paragraph': paragraph,
      'primaryBtnText': primaryBtnText,
      'primaryBtnLink': primaryBtnLink,
      'secondaryBtnText': secondaryBtnText,
      'secondaryBtnLink': secondaryBtnLink,
      'backgroundImage': backgroundImage,
    };
  }
}
