class CorporatesChampioningTitleModel {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? image1;
  final String? buttonText;
  final String? buttonLink;

  CorporatesChampioningTitleModel({
    this.id,
    this.title,
    this.subtitle,
    this.image1,
    this.buttonText,
    this.buttonLink,

  });

  factory CorporatesChampioningTitleModel.fromJson(Map<String, dynamic> json) {
    return CorporatesChampioningTitleModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image1: json['image1'] as String?,
      buttonText: json['buttonText'] as String?,
      buttonLink: json['buttonLink'] as String?,
    );
  }
}
