class CsrObjectiveModel {
  final String? title;
  final String? subTitle;

  CsrObjectiveModel({
    this.title,
    this.subTitle,
  });

  /// Factory: Create instance from JSON
  factory CsrObjectiveModel.fromJson(Map<String, dynamic> json) {
    return CsrObjectiveModel(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
    );
  }
}
