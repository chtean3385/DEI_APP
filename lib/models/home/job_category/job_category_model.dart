class JobCategoryMode {
  final String id;
  final String title;
  final String image;
  final String desc;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  JobCategoryMode({
    required this.id,
    required this.title,
    required this.image,
    required this.desc,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory JobCategoryMode.fromJson(Map<String, dynamic> json) {
    return JobCategoryMode(
      id: json['_id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      desc: json['desc'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'image': image,
    'desc': desc,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    '__v': v,
  };
}