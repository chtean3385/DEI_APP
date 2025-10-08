

class OrganizationalBenefitModel {
  final String id;
  final String? title;
  final List<Benefit>? benefits;

  OrganizationalBenefitModel({
    required this.id,
    this.title,
    this.benefits,

  });

  factory OrganizationalBenefitModel.fromJson(Map<String, dynamic> json) {
    return OrganizationalBenefitModel(
      id: json['_id'] as String,
      title: json['title'] as String?,
      benefits: json['benefits'] != null
          ? (json['benefits'] as List)
          .map((e) => Benefit.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'benefits': benefits?.map((e) => e.toJson()).toList(),
    };
  }
}

class Benefit {
  final String id;
  final String? icon;
  final String? heading;
  final String? description;

  Benefit({
    required this.id,
    this.icon,
    this.heading,
    this.description,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      id: json['_id'] as String,
      icon: json['icon'] as String?,
      heading: json['heading'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'icon': icon,
      'heading': heading,
      'description': description,
    };
  }
}
