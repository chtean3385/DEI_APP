class JobServiceModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final String buttonLink;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  JobServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.buttonLink,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory JobServiceModel.fromJson(Map<String, dynamic> json) {
    return JobServiceModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      buttonLink: json['buttonLink'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'image': image,
      'buttonLink': buttonLink,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
