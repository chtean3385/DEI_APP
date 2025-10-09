class DisabilityBottomDetailModel {
  final String? id;
  final List<SectionCard>? sectionCards;
  final String? quote;
  final String? ctaText;
  final String? ctaLink;
  final String? backgroundImage;

  DisabilityBottomDetailModel({
    this.id,
    this.sectionCards,
    this.quote,
    this.ctaText,
    this.ctaLink,
    this.backgroundImage,
  });

  factory DisabilityBottomDetailModel.fromJson(Map<String, dynamic> json) {
    return DisabilityBottomDetailModel(
      id: json['_id'] as String?,
      sectionCards: (json['sectionCards'] as List?)
          ?.map((e) => SectionCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      quote: json['quote'] as String?,
      ctaText: json['ctaText'] as String?,
      ctaLink: json['ctaLink'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
    );
  }
}

class SectionCard {
  final String? id;
  final String? title;
  final String? description;

  SectionCard({
    this.id,
    this.title,
    this.description,
  });

  factory SectionCard.fromJson(Map<String, dynamic> json) {
    return SectionCard(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }
}
