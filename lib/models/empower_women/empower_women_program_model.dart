

class WomenProgramModel {
  final String? id;
  final String? pillText;
  final String? title;
  final String? subtitle;
  final String? image;

  WomenProgramModel({
    this.id,
    this.pillText,
    this.title,
    this.subtitle,
    this.image,
  });

  factory WomenProgramModel.fromJson(Map<String, dynamic> json) {
    return WomenProgramModel(
      id: json['_id'] as String?,
      pillText: json['pillText'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'pillText': pillText,
    'title': title,
    'subtitle': subtitle,
    'image': image,
  };
}
