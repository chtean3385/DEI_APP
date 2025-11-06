class CsrImpactModel {
  final String? sectionTitle;
  final String? subTitle;
  final List<CsrImpactCardModel>? cards;

  CsrImpactModel({
    this.sectionTitle,
    this.subTitle,
    this.cards,
  });

  /// Factory: Create instance from JSON
  factory CsrImpactModel.fromJson(Map<String, dynamic> json) {
    return CsrImpactModel(
      sectionTitle: json['sectionTitle'] as String?,
      subTitle: json['subTitle'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CsrImpactCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}

class CsrImpactCardModel {
  final String? icon;
  final String? title;
  final String? subtitle;
  final String? image;
  final int? count;

  CsrImpactCardModel({
    this.icon,
    this.title,
    this.subtitle,
    this.image,
    this.count,
  });

  /// Factory: Create instance from JSON
  factory CsrImpactCardModel.fromJson(Map<String, dynamic> json) {
    return CsrImpactCardModel(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image: json['image'] as String?,
      count: json['count'] as int?,
    );
  }

}
