class BaseModel {
  final bool success;
  final String message;
  final dynamic data;

  BaseModel({
    required this.success,
    required this.message,
    this.data,
  });

  bool get isSuccess => success;

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
