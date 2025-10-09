class DisabilityInclusionStepsModel {
  final String? id;
  final String? sectionLeftTitle;
  final String? sectionRightTitle;
  final List<InclusionRow>? rows;

  DisabilityInclusionStepsModel({
    this.id,
    this.sectionLeftTitle,
    this.sectionRightTitle,
    this.rows,
  });

  factory DisabilityInclusionStepsModel.fromJson(Map<String, dynamic> json) {
    return DisabilityInclusionStepsModel(
      id: json['_id'] as String?,
      sectionLeftTitle: json['sectionLeftTitle'] as String?,
      sectionRightTitle: json['sectionRightTitle'] as String?,
      rows: (json['rows'] as List?)
          ?.map((e) => InclusionRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class InclusionRow {
  final String? id;
  final LeftContent? left;
  final RightContent? right;

  InclusionRow({this.id, this.left, this.right});

  factory InclusionRow.fromJson(Map<String, dynamic> json) {
    return InclusionRow(
      id: json['_id'] as String?,
      left: json['left'] != null
          ? LeftContent.fromJson(json['left'] as Map<String, dynamic>)
          : null,
      right: json['right'] != null
          ? RightContent.fromJson(json['right'] as Map<String, dynamic>)
          : null,
    );
  }
}

class LeftContent {
  final String? id;
  final String? icon;
  final String? title;
  final String? text;

  LeftContent({this.id, this.icon, this.title, this.text});

  factory LeftContent.fromJson(Map<String, dynamic> json) {
    return LeftContent(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
    );
  }
}

class RightContent {
  final String? id;
  final String? step;
  final String? title;
  final String? aux;

  RightContent({this.id, this.step, this.title, this.aux});

  factory RightContent.fromJson(Map<String, dynamic> json) {
    return RightContent(
      id: json['_id'] as String?,
      step: json['step'] as String?,
      title: json['title'] as String?,
      aux: json['aux'] as String?,
    );
  }
}
