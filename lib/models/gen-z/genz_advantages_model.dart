

class GenZAdvantageModel {
  String? id;
  List<GenZCardModel>? cards;
  String? image;


  GenZAdvantageModel({
    this.id,
    this.cards,
    this.image,

  });

  factory GenZAdvantageModel.fromJson(Map<String, dynamic> json) {
    return GenZAdvantageModel(
      id: json['_id'] as String?,
      cards: (json['cards'] as List?)
          ?.map((e) => GenZCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,

    );
  }

}

class GenZCardModel {
  String? icon;
  String? title;
  String? description;
  String? id;

  GenZCardModel({
    this.icon,
    this.title,
    this.description,
    this.id,
  });

  factory GenZCardModel.fromJson(Map<String, dynamic> json) {
    return GenZCardModel(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
    );
  }

}
