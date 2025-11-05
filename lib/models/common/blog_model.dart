class BlogModel {
  final String? id;
  final String? title;
  final String? category;
  final String? image;
  final String? description;
  final String? authorImage;
  final String? authorName;
  final String? metaTitle;
  final String? metaDescription;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  BlogModel({
    this.id,
    this.title,
    this.category,
    this.image,
    this.description,
    this.authorImage,
    this.authorName,
    this.metaTitle,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      authorImage: json['authorImage'] as String?,
      authorName: json['authorName'] as String?,
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      status: json['status'] as String?,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
      v: json['__v'] as int?,
    );
  }

}
