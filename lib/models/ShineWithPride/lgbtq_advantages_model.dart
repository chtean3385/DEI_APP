

import '../defense_veteran/dv_advantages_model.dart';

class LgbtqAdvantageModel {
  final String? id;
  final String? sectionTitle;
  final List<VeteranAsset>? cards;


  LgbtqAdvantageModel({
    this.id,
    this.sectionTitle,
    this.cards,
  });

  factory LgbtqAdvantageModel.fromJson(Map<String, dynamic> json) {
    return LgbtqAdvantageModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      cards: (json['cards'] as List?)
          ?.map((e) => VeteranAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}

