class ExploreServiceProgramModel {
  final String? icon;
  final String? backgroundColor;
  final String? paidTextBadgeTitle;
  final String? title;
  final String? subtitle;
  final String? buttonLink;
  final String? id;

  ExploreServiceProgramModel({
    this.icon,
    this.backgroundColor,
    this.paidTextBadgeTitle,
    this.title,
    this.subtitle,
    this.buttonLink,
    this.id,
  });

  factory ExploreServiceProgramModel.fromJson(Map<String, dynamic> json) {
    return ExploreServiceProgramModel(
      icon: json['icon'],
      backgroundColor: json['backgroundColor'],
      paidTextBadgeTitle: json['paidTextBadgeTitle'],
      title: json['title'],
      subtitle: json['subtitle'],
      buttonLink: json['buttonLink'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'backgroundColor': backgroundColor,
      'paidTextBadgeTitle': paidTextBadgeTitle,
      'title': title,
      'subtitle': subtitle,
      'buttonLink': buttonLink,
      '_id': id,
    };
  }
}
