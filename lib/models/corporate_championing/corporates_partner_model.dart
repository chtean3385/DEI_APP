
class CorporatePartnerDataModel {
  final String? id;
  final String? sectionTitle;
  final List<WhyPartnerCardModel>? cards;
  final String? status;


  CorporatePartnerDataModel({
    this.id,
    this.sectionTitle,
    this.cards,
    this.status,
  });

  factory CorporatePartnerDataModel.fromJson(Map<String, dynamic> json) {
    return CorporatePartnerDataModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => WhyPartnerCardModel.fromJson(e))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'sectionTitle': sectionTitle,
    'cards': cards?.map((e) => e.toJson()).toList(),
    'status': status,
  };
}

class WhyPartnerCardModel {
  final String? id;
  final String? icon;
  final String? title;
  final String? subtitle;

  WhyPartnerCardModel({
    this.id,
    this.icon,
    this.title,
    this.subtitle,
  });

  factory WhyPartnerCardModel.fromJson(Map<String, dynamic> json) {
    return WhyPartnerCardModel(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'icon': icon,
    'title': title,
    'subtitle': subtitle,
  };
}
