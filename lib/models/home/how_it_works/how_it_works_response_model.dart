import 'how_it_work_model.dart';

class HowItWorksResponse {
  final String? id;
  final String? heading;
  final String? subheading;
  final String? buttonLink;
  final List<HowItsWorkModel>? howItsWorks;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  HowItWorksResponse({
    this.id,
    this.heading,
    this.subheading,
    this.buttonLink,
    this.howItsWorks,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory HowItWorksResponse.fromJson(Map<String, dynamic> json) {
    final rawList = json['howItsWorks'];

    List<HowItsWorkModel>? parsedList;
    if (rawList is List) {
      parsedList = rawList
          .map((e) => HowItsWorkModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      parsedList = []; // or null if you prefer
    }

    return HowItWorksResponse(
      id: json['_id'] as String?,
      heading: json['heading'] as String?,
      subheading: json['subheading'] as String?,
      buttonLink: json['buttonLink'] as String?,
      howItsWorks: parsedList,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'heading': heading,
      'subheading': subheading,
      'buttonLink': buttonLink,
      'howItsWorks': howItsWorks?.map((e) => e.toJson()).toList(),
      'status': status,
    };
  }
}


