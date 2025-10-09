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
  final RowContentModel? left;
  final RowContentModel? right;

  InclusionRow({
    this.id,
    this.left,
    this.right,
  });

  factory InclusionRow.fromJson(Map<String, dynamic> json) {
    return InclusionRow(
      id: json['_id'] as String?,
      left: json['left'] != null
          ? RowContentModel.fromJson(json['left'] as Map<String, dynamic>)
          : null,
      right: json['right'] != null
          ? RowContentModel.fromJson(json['right'] as Map<String, dynamic>)
          : null,
    );
  }
}

class RowContentModel {
  final String? id;
  final String? icon;  // Only for 'left' side
  final String? step;  // Only for 'right' side
  final String? title;
  final String? text;
  final String? aux;   // Optional field, for 'right' side extra info

  RowContentModel({
    this.id,
    this.icon,
    this.step,
    this.title,
    this.text,
    this.aux,
  });

  factory RowContentModel.fromJson(Map<String, dynamic> json) {
    return RowContentModel(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      step: json['step'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      aux: json['aux'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'icon': icon,
      'step': step,
      'title': title,
      'text': text,
      'aux': aux,
    };
  }
}
