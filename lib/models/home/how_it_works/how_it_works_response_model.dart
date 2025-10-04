import 'how_it_work_model.dart';

class HowItWorksResponse {
  final String? id;
  final String? heading;
  final String? subheading;
  final String? buttonLink;
  final List<HowItsWorkModel>? howItsWorks;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  HowItWorksResponse({
    this.id,
    this.heading,
    this.subheading,
    this.buttonLink,
    this.howItsWorks,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HowItWorksResponse.fromJson(Map<String, dynamic> json) {
    return HowItWorksResponse(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      subheading: json['subheading'] as String?,
      buttonLink: json['buttonLink'] as String?,
      howItsWorks: (json['howItsWorks'] as List<dynamic>?)
          ?.map((e) => HowItsWorkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'heading': heading,
      'subheading': subheading,
      'buttonLink': buttonLink,
      'howItsWorks': howItsWorks?.map((e) => e.toJson()).toList(),
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}


