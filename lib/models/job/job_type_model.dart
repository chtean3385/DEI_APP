class JobTypeModel {
  final String? id;
  final String? name;

  JobTypeModel({
    this.id,
    this.name,
  });

  factory JobTypeModel.fromJson(Map<String, dynamic> json) {
    return JobTypeModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
