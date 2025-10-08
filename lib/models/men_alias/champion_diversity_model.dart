
class ChampionDiversityModel {
  final String id;
  final String? title;
  final List<PointModel>? points;

  ChampionDiversityModel({
    required this.id,
    this.title,
    this.points,
  });

  factory ChampionDiversityModel.fromJson(Map<String, dynamic> json) {
    return ChampionDiversityModel(
      id: json['_id'] as String,
      title: json['title'] as String?,
      points: json['points'] != null
          ? (json['points'] as List)
          .map((e) => PointModel.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

}

class PointModel {
  final String id;
  final String? icon;
  final String? heading;
  final String? description;

  PointModel({
    required this.id,
    this.icon,
    this.heading,
    this.description,
  });

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(
      id: json['_id'] as String,
      icon: json['icon'] as String?,
      heading: json['heading'] as String?,
      description: json['description'] as String?,
    );
  }

}
