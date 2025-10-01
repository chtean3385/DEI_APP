


import 'job_category_model.dart';

class JobCategoryGroup {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<JobCategoryMode> categories;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  JobCategoryGroup({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.categories,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory JobCategoryGroup.fromJson(Map<String, dynamic> json) {
    var categoriesJson = json['categories'] as List<dynamic>;
    List<JobCategoryMode> categoryList =
    categoriesJson.map((e) => JobCategoryMode.fromJson(e)).toList();

    return JobCategoryGroup(
      id: json['_id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      categories: categoryList,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'subtitle': subtitle,
    'description': description,
    'categories': categories.map((e) => e.toJson()).toList(),
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    '__v': v,
  };
}
