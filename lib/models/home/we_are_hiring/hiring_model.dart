class HiringBannerModel {
  final String? id;
  final String? text1;
  final String? text2;
  final String? buttonLink;
  final bool? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  HiringBannerModel({
    this.id,
    this.text1,
    this.text2,
    this.buttonLink,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HiringBannerModel.fromJson(Map<String, dynamic> json) {
    return HiringBannerModel(
      id: json['_id'] as String?,
      text1: json['text1'] as String?,
      text2: json['text2'] as String?,
      buttonLink: json['buttonLink'] as String?,
      status: json['status'] != null
          ? json['status'].toString().toLowerCase() == 'true'
          : null,
      createdAt:
      json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt:
      json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'text1': text1,
      'text2': text2,
      'buttonLink': buttonLink,
      'status': status?.toString(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
