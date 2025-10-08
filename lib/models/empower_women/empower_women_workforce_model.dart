
class EmpowerWomenWorkForceModel {
  final String? id;
  final String? sectionTitle;
  final String? sectionSubtitle;
  final String? image;
  final List<CardData>? cards;

  EmpowerWomenWorkForceModel({
    this.id,
    this.sectionTitle,
    this.sectionSubtitle,
    this.image,
    this.cards,
  });

  factory EmpowerWomenWorkForceModel.fromJson(Map<String, dynamic> json) {
    return EmpowerWomenWorkForceModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      sectionSubtitle: json['sectionSubtitle'] as String?,
      image: json['image'] as String?,
      cards: (json['cards'] as List?)
          ?.map((item) => CardData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'sectionTitle': sectionTitle,
    'sectionSubtitle': sectionSubtitle,
    'image': image,
    'cards': cards?.map((e) => e.toJson()).toList(),
  };
}

class CardData {
  final String? id;
  final String? icon;
  final String? title;
  final String? description;

  CardData({
    this.id,
    this.icon,
    this.title,
    this.description,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'icon': icon,
    'title': title,
    'description': description,
  };
}
