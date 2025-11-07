
class IndustryModel {
  final String? id;
  final String? heading;
  final String? subHeading;
  final List<IndustryDepartmentModel>? department;
  final List<String>? users;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  IndustryModel({
    this.id,
    this.heading,
    this.subHeading,
    this.department,
    this.users,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory IndustryModel.fromJson(Map<String, dynamic> json) {
    return IndustryModel(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      subHeading: json['subHeading'] as String?,
      department: (json['department'] as List<dynamic>?)
          ?.map((e) => IndustryDepartmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'heading': heading,
      'subHeading': subHeading,
      'department': department?.map((e) => e.toJson()).toList(),
      'users': users,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class IndustryDepartmentModel {
  final String? id;
  final String? name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? focus;
  final String? trend;
  final int? openJobs;

  IndustryDepartmentModel({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.focus,
    this.trend,
    this.openJobs,
  });

  factory IndustryDepartmentModel.fromJson(Map<String, dynamic> json) {
    return IndustryDepartmentModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      focus: json['focus'] as String?,
      trend: json['trend'] as String?,
      openJobs: json['openJobs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'focus': focus,
      'trend': trend,
      'openJobs': openJobs,
    };
  }
}
