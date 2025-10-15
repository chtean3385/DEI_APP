

class DeiCorporatesModel {
  final String? id;
  final String? sectionTitle;
  final List<DeiSolutionCardModel>? cards;


  DeiCorporatesModel({
    this.id,
    this.sectionTitle,
    this.cards,
  });

  factory DeiCorporatesModel.fromJson(Map<String, dynamic> json) {
    return DeiCorporatesModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => DeiSolutionCardModel.fromJson(e))
          .toList(),
    );
  }
}

class DeiSolutionCardModel {
  final String? id;
  final String? icon;
  final String? title;
  final String? subtitle;
  final String? buttonLink;

  DeiSolutionCardModel({
    this.id,
    this.icon,
    this.title,
    this.subtitle,
    this.buttonLink,
  });

  factory DeiSolutionCardModel.fromJson(Map<String, dynamic> json) {
    return DeiSolutionCardModel(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      buttonLink: json['buttonLink'] as String?,
    );
  }
}
