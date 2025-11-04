class DashBoardModel {
  final String? key;
  final String? title;
  final int? count;

  DashBoardModel({this.key, this.title, this.count});

  factory DashBoardModel.fromJson(Map<String, dynamic> json) {
    return DashBoardModel(
      key: json['key'] as String?,
      title: json['title'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'title': title,
      'count': count,
    };
  }
}