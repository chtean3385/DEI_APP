

// Inclusion Item Model
class InclusionItemModel {
  final String? id;
  final String? icon;
  final String? title;
  final String? text;

  InclusionItemModel({this.id, this.icon, this.title, this.text});

  factory InclusionItemModel.fromJson(Map<String, dynamic> json) {
    return InclusionItemModel(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
    );
  }
}

// Main Inclusion Section Model
class InclusionPointsModel {
  final String? id;
  final String? heading;
  final List<InclusionItemModel>? inclusionItems;


  InclusionPointsModel({
    this.id,
    this.heading,
    this.inclusionItems,

  });

  factory InclusionPointsModel.fromJson(Map<String, dynamic> json) {
    return InclusionPointsModel(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      inclusionItems: json['inclusionItems'] != null
          ? List<InclusionItemModel>.from(
          (json['inclusionItems'] as List)
              .map((x) => InclusionItemModel.fromJson(x)))
          : null,
    );
  }

}
