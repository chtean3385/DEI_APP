class BaseModel {
  final bool success;
  final String message;
  final dynamic data;
  final int? currentPage;
  final int? totalPages;
  final int? totalJobs;
  final int? count;

  BaseModel({
    required this.success,
    required this.message,
    this.data,
    this.currentPage,
    this.totalPages,
    this.totalJobs,
    this.count,
  });

  bool get isSuccess => success;

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      success: json['success'] ?? (json['status'] =="success")  ?? false,
      message: json['message'] ?? '',
      data: json['data'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalJobs: json['totalJobs'],
      count: json['count'],
    );
  }
}
