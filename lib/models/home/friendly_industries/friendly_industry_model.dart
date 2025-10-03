class FriendlyIndustry {
  final String name;
  final String icon;
  final String alt;
  final Badge badge;
  final String description;
  final String location;
  final String jobs;

  FriendlyIndustry({
    required this.name,
    required this.icon,
    required this.alt,
    required this.badge,
    required this.description,
    required this.location,
    required this.jobs,
  });

  factory FriendlyIndustry.fromJson(Map<String, dynamic> json) {
    return FriendlyIndustry(
      name: json['name'] as String,
      icon: json['icon'] as String,
      alt: json['alt'] as String,
      badge: Badge.fromJson(json['badge'] as Map<String, dynamic>),
      description: json['description'] as String,
      location: json['location'] as String,
      jobs: json['jobs'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'alt': alt,
      'badge': badge.toJson(),
      'description': description,
      'location': location,
      'jobs': jobs,
    };
  }
}

class Badge {
  final String text;
  final String color;

  Badge({
    required this.text,
    required this.color,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      text: json['text'] as String,
      color: json['color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'color': color,
    };
  }
}
