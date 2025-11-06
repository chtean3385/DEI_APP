class FocusAreaModel {
  final String? sectionTitle;
  final List<FocusCardModel>? cards;

  FocusAreaModel({
    this.sectionTitle,
    this.cards,
  });

  /// Factory: Create instance from JSON
  factory FocusAreaModel.fromJson(Map<String, dynamic> json) {
    return FocusAreaModel(
      sectionTitle: json['sectionTitle'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => FocusCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}

class FocusCardModel {
  final String? icon;
  final String? title;
  final String? subtitle;

  FocusCardModel({
    this.icon,
    this.title,
    this.subtitle,
  });

  /// Factory: Create instance from JSON
  factory FocusCardModel.fromJson(Map<String, dynamic> json) {
    return FocusCardModel(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

}
