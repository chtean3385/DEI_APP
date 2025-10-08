

class AllyshipMatterModel {
  final String id;
  final String? title;
  final String? description;

  AllyshipMatterModel({
    required this.id,
    this.title,
    this.description,
  });

  factory AllyshipMatterModel.fromJson(Map<String, dynamic> json) {
    return AllyshipMatterModel(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
    };
  }
}
