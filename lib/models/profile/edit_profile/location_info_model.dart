class LocationInfoModel {
  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;

  LocationInfoModel({
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
  });

  // Convert from JSON
  factory LocationInfoModel.fromJson(Map<String, dynamic> json) {
    return LocationInfoModel(
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      pincode: json['pincode'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
    };
  }

  // Copy with method
  LocationInfoModel copyWith({
    String? address,
    String? city,
    String? state,
    String? country,
    String? pincode,
  }) {
    return LocationInfoModel(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      pincode: pincode ?? this.pincode,
    );
  }
}
