class LocalJsonItemModel {
  final String name;

  LocalJsonItemModel({required this.name});

  factory LocalJsonItemModel.fromJson(String name) {
    return LocalJsonItemModel(name: name);
  }

  static List<LocalJsonItemModel> listFromJson(Map<String, dynamic> json) {
    final List degrees = json['degrees'] ?? json['institutions'] ?? json['positions']??  [];
    return degrees.map((name) => LocalJsonItemModel.fromJson(name)).toList();
  }

}
