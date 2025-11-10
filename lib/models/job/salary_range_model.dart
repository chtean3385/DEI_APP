class SalaryRangeModel {
  final String? id;
  final String? name;

  SalaryRangeModel({
    this.id,
    this.name,
  });

  factory SalaryRangeModel.fromJson(Map<String, dynamic> json) {
    return SalaryRangeModel(
      id: json['_id'] as String?,
      name: json['range'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'range': name,
    };
  }
}
