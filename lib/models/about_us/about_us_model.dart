class AboutUsModel {
  final String? id;
  final String? heading;
  final String? description;
  final String? impactTitle;
  final String? jobsPromoted;
  final String? employers;
  final String? image;


  AboutUsModel({
    this.id,
    this.heading,
    this.description,
    this.impactTitle,
    this.jobsPromoted,
    this.employers,
    this.image,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      description: json['description'] as String?,
      impactTitle: json['impactTitle'] as String?,
      jobsPromoted: json['jobsPromoted'] as String?,
      employers: json['employers'] as String?,
      image: json['image'] as String?,
    );
  }
}
