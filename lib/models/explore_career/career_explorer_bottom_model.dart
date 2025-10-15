class CareerExplorerBottomModel {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? buttonIcon;
  final String? buttonText;
  final String? buttonLink;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CareerExplorerBottomModel({
    this.id,
    this.title,
    this.subtitle,
    this.buttonIcon,
    this.buttonText,
    this.buttonLink,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CareerExplorerBottomModel.fromJson(Map<String, dynamic> json) {
    return CareerExplorerBottomModel(
      id: json['_id'],
      title: json['title'],
      subtitle: json['subtitle'],
      buttonIcon: json['buttonIcon'],
      buttonText: json['buttonText'],
      buttonLink: json['buttonLink'],
      status: json['status'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'subtitle': subtitle,
      'buttonIcon': buttonIcon,
      'buttonText': buttonText,
      'buttonLink': buttonLink,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
