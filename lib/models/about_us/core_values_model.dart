class CoreValuesModel {
  final String? id;
  final String? title;
  final List<CoreValueItem>? coreValues;

  CoreValuesModel({this.id, this.title, this.coreValues});

  factory CoreValuesModel.fromJson(Map<String, dynamic> json) {
    return CoreValuesModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      coreValues: (json['coreValues'] as List?)
          ?.map((e) => CoreValueItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}

class CoreValueItem {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? icon;

  CoreValueItem({this.id, this.title, this.description, this.image, this.icon});

  factory CoreValueItem.fromJson(Map<String, dynamic> json) {
    return CoreValueItem(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'image': image,
      'icon': icon,
    };
  }
}
