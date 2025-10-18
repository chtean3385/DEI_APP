import 'dart:convert';

class JobPostModel {
  final String? id;
  final String? title;
  final String? description;
  final String? department;
  final String? salary;
  final String? category;
  final List<String>? tags;
  final List<String>? jobImageUrls;

  final String? area;
  final String? city;
  final String? state;
  final String? country;

  final bool? isActive; // Optional: active/inactive post
  final DateTime? postedOn; // Optional: date of posting

  JobPostModel({
    this.id,
    this.title,
    this.description,
    this.department,
    this.salary,
    this.category,
    this.tags,
    this.area,
    this.city,
    this.state,
    this.country,
    this.isActive,
    this.postedOn,
    this.jobImageUrls,
  });

  /// From JSON
  factory JobPostModel.fromJson(Map<String, dynamic> json) {
    return JobPostModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      department: json['department'] as String?,
      salary: json['salary'] as String?,
      category: json['category'] as String?,
      tags: json['tags'] != null
          ? List<String>.from(json['tags'])
          : null,
      area: json['area'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      isActive: json['isActive'] as bool?,
      postedOn: json['postedOn'] != null
          ? DateTime.tryParse(json['postedOn'])
          : null,
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'department': department,
      'salary': salary,
      'category': category,
      'tags': tags,
      'area': area,
      'city': city,
      'state': state,
      'country': country,
      'isActive': isActive,
      'postedOn': postedOn?.toIso8601String(),
    };
  }

  /// Copy with
  JobPostModel copyWith({
    String? id,
    String? title,
    String? description,
    String? department,
    String? salary,
    String? category,
    List<String>? tags,
    List<String>? jobImageUrls,
    String? area,
    String? city,
    String? state,
    String? country,
    bool? isActive,
    DateTime? postedOn,
  }) {
    return JobPostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      department: department ?? this.department,
      salary: salary ?? this.salary,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      jobImageUrls: jobImageUrls ?? this.jobImageUrls,
      area: area ?? this.area,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      isActive: isActive ?? this.isActive,
      postedOn: postedOn ?? this.postedOn,
    );
  }

  /// From raw JSON string
  factory JobPostModel.fromRawJson(String str) =>
      JobPostModel.fromJson(json.decode(str));

  /// To raw JSON string
  String toRawJson() => json.encode(toJson());
}
