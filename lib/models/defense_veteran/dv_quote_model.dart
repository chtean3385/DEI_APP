class VeteranQuoteModel {
  final String? id;
  final String? text;
  final String? quote;

  VeteranQuoteModel({this.id, this.text, this.quote});

  factory VeteranQuoteModel.fromJson(Map<String, dynamic> json) {
    return VeteranQuoteModel(
      id: json['_id'] as String?,
      text: json['text'] as String?,
      quote: json['quote'] as String?,
    );
  }
}
