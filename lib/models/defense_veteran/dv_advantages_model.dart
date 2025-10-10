

class VeteranAdvantageModel {
  final String? id;
  final String? sectionTitle;
  final List<VeteranAsset>? assets;


  VeteranAdvantageModel({
    this.id,
    this.sectionTitle,
    this.assets,
  });

  factory VeteranAdvantageModel.fromJson(Map<String, dynamic> json) {
    return VeteranAdvantageModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      assets: (json['assets'] as List?)
          ?.map((e) => VeteranAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}

class VeteranAsset {
  final String? id;
  final String? icon;
  final String? title;
  final String? description;

  VeteranAsset({
    this.id,
    this.icon,
    this.title,
    this.description,
  });

  factory VeteranAsset.fromJson(Map<String, dynamic> json) {
    return VeteranAsset(
      id: json['_id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }

}
