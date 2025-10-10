import 'package:dei_champions/models/men_alias/organizational_benefit_model.dart';

class DvOrganizationalBenefitModel {
  final String? id;
  final String? sectionTitle;
  final List<BenefitModel>? benefits;

  DvOrganizationalBenefitModel({this.id, this.sectionTitle, this.benefits});

  factory DvOrganizationalBenefitModel.fromJson(Map<String, dynamic> json) {
    return DvOrganizationalBenefitModel(
      id: json['_id'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
      benefits: (json['benefits'] as List?)
          ?.map((e) => BenefitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
