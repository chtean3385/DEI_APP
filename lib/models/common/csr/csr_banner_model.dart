class CsrBannerModel {
  final String? backgroundImage;
  final String? heading;
  final String? subHeading;

  CsrBannerModel({this.backgroundImage, this.heading, this.subHeading});

  /// Factory: create instance from JSON
  factory CsrBannerModel.fromJson(Map<String, dynamic> json) {
    return CsrBannerModel(
      backgroundImage: json['backgroundImage'] as String?,
      heading: json['heading'] as String?,
      subHeading: json['subHeading'] as String?,
    );
  }

}
