class WhatWeDoModel {
  final String? id;
  final String? title;
  final String? description;
  final String? image;

  WhatWeDoModel({this.id, this.title, this.description, this.image});

  factory WhatWeDoModel.fromJson(Map<String, dynamic> json) {
    return WhatWeDoModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
