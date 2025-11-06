

class PricingPlanModel {
  final String? id;
  final String? name;
  final int? price;
  final String? currency;
  final String? billingCycle;
  final String? description;
  final List<String>? features;
  final String? ctaText;

  PricingPlanModel({
    this.id,
    this.name,
    this.price,
    this.currency,
    this.billingCycle,
    this.description,
    this.features,
    this.ctaText,
  });

  factory PricingPlanModel.fromJson(Map<String, dynamic> json) {
    return PricingPlanModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      billingCycle: json['billingCycle'] as String?,
      description: json['description'] as String?,
      features: (json['features'] as List?)?.map((e) => e as String).toList(),
      ctaText: json['ctaText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'currency': currency,
      'billingCycle': billingCycle,
      'description': description,
      'features': features,
      'ctaText': ctaText,
    };
  }
}
