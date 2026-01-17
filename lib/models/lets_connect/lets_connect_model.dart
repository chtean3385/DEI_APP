class LetsConnectModel {
  final String? id;
  final String? title;
  final String? subTitle;
  final String? quote;
  final String? contactEmail;
  final String? contactNumber;

  LetsConnectModel({
    this.id,
    this.title,
    this.subTitle,
    this.quote,
    this.contactEmail,
    this.contactNumber,
  });

  factory LetsConnectModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return LetsConnectModel();

    return LetsConnectModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      quote: json['quote'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactNumber: json['contactNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'subTitle': subTitle,
      'quote': quote,
      'contactEmail': contactEmail,
      'contactNumber': contactNumber,
    };
  }
}
