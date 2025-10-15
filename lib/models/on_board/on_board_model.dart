class OnBoardModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? buttonText;

  OnBoardModel({ this.image,  this.title, this.subTitle, this.buttonText});
  factory OnBoardModel.fromJson(Map<String, dynamic> json) {
    return OnBoardModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      subTitle: json['subtitle'] ?? '',
      buttonText: json['buttonText'] ?? '',
    );
  }

}
