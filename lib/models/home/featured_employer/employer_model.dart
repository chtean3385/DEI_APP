class Employer {
  final String? logo;
  final String? badge;
  final String? badgeClass;
  final String? title;
  final List<String>? tags;

  Employer({
    this.logo,
    this.badge,
    this.badgeClass,
    this.title,
    this.tags,
  });

  /// ✅ Factory constructor for JSON deserialization
  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      logo: json['logo'] as String?,
      badge: json['badge'] as String?,
      badgeClass: json['badgeClass'] as String?,
      title: json['title'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }

  /// ✅ Convert object back to JSON
  Map<String, dynamic> toJson() {
    return {
      "logo": logo,
      "badge": badge,
      "badgeClass": badgeClass,
      "title": title,
      "tags": tags,
    };
  }
}
