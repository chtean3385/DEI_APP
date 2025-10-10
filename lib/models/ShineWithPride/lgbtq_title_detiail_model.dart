class LgbtqTitleModel {
  final String? id;
  final String? title;
  final String? icon;
  final String? subtext;
  final String? buttonText;
  final String? buttonLink;

  LgbtqTitleModel({
    this.id,
    this.title,
    this.icon,
    this.subtext,
    this.buttonText,
    this.buttonLink,
  });

  // Factory constructor to parse JSON
  factory LgbtqTitleModel.fromJson(Map<String, dynamic> json) {
    return LgbtqTitleModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      subtext: json['subtext'] as String?,
      buttonText: json['buttonText'] as String?,
      buttonLink: json['buttonLink'] as String?,
    );
  }

  // Convert model back to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'icon': icon,
      'subtext': subtext,
      'buttonText': buttonText,
      'buttonLink': buttonLink,
    };
  }
}

