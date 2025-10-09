
class GenZBottomButtonModel {
  final String? id;
  final String? text;
  final List<CtaGenzButtonModel?>? ctas;

  GenZBottomButtonModel({
    this.id,
    this.text,
    this.ctas,
  });


  factory GenZBottomButtonModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GenZBottomButtonModel();
    return GenZBottomButtonModel(
      id: json['_id'] as String?,
      text: json['text'] as String?,
      ctas: (json['ctas'] as List<dynamic>?)
          ?.map((e) => e == null ? null : CtaGenzButtonModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );
  }

}

class CtaGenzButtonModel {
  final String? href;
  final String? icon;
  final String? label;
  final bool? primary;
  final String? id;

  CtaGenzButtonModel({
    this.href,
    this.icon,
    this.label,
    this.primary,
    this.id,
  });

  CtaGenzButtonModel copyWith({
    String? href,
    String? icon,
    String? label,
    bool? primary,
    String? id,
  }) {
    return CtaGenzButtonModel(
      href: href ?? this.href,
      icon: icon ?? this.icon,
      label: label ?? this.label,
      primary: primary ?? this.primary,
      id: id ?? this.id,
    );
  }

  factory CtaGenzButtonModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CtaGenzButtonModel();
    return CtaGenzButtonModel(
      href: json['href'] as String?,
      icon: json['icon'] as String?,
      label: json['label'] as String?,
      primary: json['primary'] as bool?,
      id: json['_id'] as String?,
    );
  }
}
