class GenZTitleModel {
  String? id;
  String? image;
  String? pillText;
  String? title;
  String? description;
  List<CtaModels>? ctas;

  GenZTitleModel({
    this.id,
    this.image,
    this.pillText,
    this.title,
    this.description,
    this.ctas,
  });

  factory GenZTitleModel.fromJson(Map<String, dynamic> json) {
    return GenZTitleModel(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      pillText: json['pillText'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      ctas: (json['ctas'] as List?)
          ?.map((e) => CtaModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CtaModels {
  String? text;
  String? icon;
  String? link;
  String? variant;
  String? id;

  CtaModels({
    this.text,
    this.icon,
    this.link,
    this.variant,
    this.id,
  });

  factory CtaModels.fromJson(Map<String, dynamic> json) {
    return CtaModels(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      link: json['link'] as String?,
      variant: json['variant'] as String?,
      id: json['_id'] as String?,
    );
  }

}
