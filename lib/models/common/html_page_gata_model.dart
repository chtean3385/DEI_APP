

class HtmlPagePageDataModel {
  final String? pageName;
  final String? content;

  HtmlPagePageDataModel({
    this.pageName,
    this.content,
  });

  factory HtmlPagePageDataModel.fromJson(Map<String, dynamic> json) {
    return HtmlPagePageDataModel(
      pageName: json['pageName'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "pageName": pageName,
      "content": content,
    };
  }
}
