class WomenQuoteModel {
  final String? id;
  final String? text;

  WomenQuoteModel({this.id, this.text});

  factory WomenQuoteModel.fromJson(Map<String, dynamic> json) {
    return WomenQuoteModel(
      id: json['_id'] as String?,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'_id': id, 'text': text};
}
