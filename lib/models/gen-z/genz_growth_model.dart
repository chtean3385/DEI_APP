

class GenZGrowthModel {
  String? id;
  String? heading;
  List<GenZGrowthItemModel>? items;
  String? bandStatement;


  GenZGrowthModel({
    this.id,
    this.heading,
    this.items,
    this.bandStatement,

  });

  factory GenZGrowthModel.fromJson(Map<String, dynamic> json) {
    return GenZGrowthModel(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      items: (json['items'] as List?)
          ?.map((e) => GenZGrowthItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bandStatement: json['bandStatement'] as String?,

    );
  }

}

class GenZGrowthItemModel {
  String? icon;
  String? title;
  String? description;
  String? id;

  GenZGrowthItemModel({
    this.icon,
    this.title,
    this.description,
    this.id,
  });

  factory GenZGrowthItemModel.fromJson(Map<String, dynamic> json) {
    return GenZGrowthItemModel(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
    );
  }

}
