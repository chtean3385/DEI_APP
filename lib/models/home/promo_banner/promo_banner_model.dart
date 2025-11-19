class PromoBannerModel {
  final String id;
  final String? title;
  final String? subTitle;
  final String? buttonLabel;
  final String? imageUrl;
  final bool isBannerImage;

  PromoBannerModel({
    required this.id,
    this.title,
    this.subTitle,
    this.buttonLabel,
    this.imageUrl,
    this.isBannerImage = false,
  });

  // --------- FROM JSON ----------
  factory PromoBannerModel.fromJson(Map<String, dynamic> json) {
    return PromoBannerModel(
      id: json['id'].toString(),
      title: json['title'],
      subTitle: json['subTitle'],
      buttonLabel: json['buttonLabel'],
      imageUrl: json['imageUrl'],
      isBannerImage: json['isBannerImage'] ?? false,
    );
  }

}
