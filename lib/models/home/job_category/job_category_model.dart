
class JobCategoryMode {
  final String? id;
  final String? title;
  final String? image;
  final String? desc;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  JobCategoryMode({
    this.id,
    this.title,
    this.image,
    this.desc,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory JobCategoryMode.fromJson(Map<String, dynamic> json) {
    return JobCategoryMode(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      desc: json['desc'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      v: json['__v'] is int ? json['__v'] as int : int.tryParse('${json['__v']}'),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'image': image,
    'desc': desc,
    'status': status,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };
}
