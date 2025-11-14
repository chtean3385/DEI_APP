class LocalJsonItemModel {
  final String name;

  LocalJsonItemModel({required this.name});

  factory LocalJsonItemModel.fromJson(Map<String, dynamic> json) {
    return LocalJsonItemModel(name: json['name'] ?? '');
  }

  static List<LocalJsonItemModel> listFromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['degrees'] ??
        json['institutions'] ??
        json['positions'] ??
        json['countries'] ??
        json['states'] ??
        [];
    return items
        .map((item) => item is String
        ? LocalJsonItemModel(name: item)
        : LocalJsonItemModel.fromJson(item))
        .toList();
  }
}


class StateModel {
  final String name;
  final List<LocalJsonItemModel> cities;

  StateModel({required this.name, required this.cities});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'],
      cities: (json['cities'] as List)
          .map((city) => LocalJsonItemModel.fromJson(city))
          .toList(),
    );
  }

  static List<StateModel> listFromJson(Map<String, dynamic> json) {
    print("aaa");
    final List degrees = json['states'] ?? [];
    print("bbb");
    return degrees.map((name) => StateModel.fromJson(name)).toList();
  }
}
