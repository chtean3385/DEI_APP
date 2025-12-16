class HomePopupModel {
  final String? imageUrl;
  final String? link;

  HomePopupModel({
    this.imageUrl,
    this.link,
  });

  factory HomePopupModel.fromJson(Map<String, dynamic>? json) {
    return HomePopupModel(
      imageUrl: (json?['image'] as Map<String, dynamic>?)?['url'] as String?,
      link: json?['link'] as String?,
    );
  }

  bool get isValid =>
      (imageUrl?.isNotEmpty ?? false) &&
          (link?.isNotEmpty ?? false);
}
