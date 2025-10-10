
class VeteranTitleModel {
  final String? DvTitleModel;
  final String? pill;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? btn1Label;
  final String? btn1Href;
  final String? btn1Icon;
  final String? btn2Label;
  final String? btn2Href;
  final String? btn2Icon;
  final String? image;


  VeteranTitleModel({
    this.DvTitleModel,
    this.pill,
    this.title,
    this.subtitle,
    this.description,
    this.btn1Label,
    this.btn1Href,
    this.btn1Icon,
    this.btn2Label,
    this.btn2Href,
    this.btn2Icon,
    this.image,
  });

  factory VeteranTitleModel.fromJson(Map<String, dynamic> json) {
    return VeteranTitleModel(
      DvTitleModel: json['_id'] as String?,
      pill: json['pill'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      btn1Label: json['btn1Label'] as String?,
      btn1Href: json['btn1Href'] as String?,
      btn1Icon: json['btn1Icon'] as String?,
      btn2Label: json['btn2Label'] as String?,
      btn2Href: json['btn2Href'] as String?,
      btn2Icon: json['btn2Icon'] as String?,
      image: json['image'] as String?,

    );
  }

}
