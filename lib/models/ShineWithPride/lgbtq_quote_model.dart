

// Quote Model
class LgbtqQuoteModel {
  final String? id;
  final String? quote;
  final String? subText;
  final String? iconLeft;
  final String? iconRight;

  LgbtqQuoteModel({
    this.id,
    this.quote,
    this.subText,
    this.iconLeft,
    this.iconRight,
  });

  factory LgbtqQuoteModel.fromJson(Map<String, dynamic> json) {
    return LgbtqQuoteModel(
      id: json['_id'] as String?,
      quote: json['quote'] as String?,
      subText: json['subText'] as String?,
      iconLeft: json['iconLeft'] as String?,
      iconRight: json['iconRight'] as String?,
    );
  }
}
