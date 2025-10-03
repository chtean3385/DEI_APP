import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../repo/shared_preference_repository.dart';
import 'api_urls.dart';

class ApiHandler {
  final Dio _dio;

  ApiHandler({Dio? dio})
      : _dio =
      dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiUrls.baseUrl,
              connectTimeout: const Duration(seconds: 20),
              receiveTimeout: const Duration(seconds: 20),
            ),
          ) {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool includeAuthToken = true,
  }) async {
    Map<String, String>? requestHeaders;
    if (includeAuthToken) {
      final token = await SharedPreferenceRepository.getToken();
      if (token.isNotEmpty) {
        requestHeaders = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
      }
    }
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: requestHeaders),
      );
      // debugPrint("response --->> ${response.toString()}");
      // debugPrint("response --->> ${response.data.toString()}");
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<dynamic> uploadFile({
    required String url,
    Map<String, dynamic>? body,
    File? file,
  }) async {
    Map<String, String>? requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final token = await SharedPreferenceRepository.getToken();
    if (token.isNotEmpty) {
      requestHeaders['Authorization'] = 'Bearer $token';
    }

    try {
      final dataToSend = FormData.fromMap(body ?? {});
      if (file != null) {
        MultipartFile multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: file.path.toString(),
        );
        dataToSend.files.add(MapEntry("image", multipartFile));
      }

      logFormData(dataToSend);

      ///print body
      final response = await _dio.post(
        url,
        data: dataToSend,
        options: Options(headers: requestHeaders),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? body,
    bool includeAuthToken = true,
  }) async {
    Map<String, String>? requestHeaders;
    if (includeAuthToken) {
      final token = await SharedPreferenceRepository.getToken();
      if (token.isNotEmpty) {
        requestHeaders = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
      }
    }
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      // print("body -- ${body.toString()}");
      // print("response -- ${response.data.toString()}");
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? body,
    bool includeAuthToken = true,
  }) async {
    Map<String, String>? requestHeaders;
    if (includeAuthToken) {
      final token = await SharedPreferenceRepository.getToken();
      if (token.isNotEmpty) {
        requestHeaders = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
      }
    }
    try {
      final response = await _dio.patch(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? body,
    bool includeAuthToken = true,
  }) async {
    Map<String, String>? requestHeaders;
    if (includeAuthToken) {
      final token = await SharedPreferenceRepository.getToken();
      if (token.isNotEmpty) {
        requestHeaders = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
      }
    }
    try {
      final response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      print("body -- ${body.toString()}");
      print("response -- ${response.data.toString()}");
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? body,
    bool includeAuthToken = true,
  }) async {
    Map<String, String>? requestHeaders;
    if (includeAuthToken) {
      final token = await SharedPreferenceRepository.getToken();
      if (token.isNotEmpty) {
        requestHeaders = {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        };
      }
    }
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  dynamic _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode == 204) return null;
    if (statusCode >= 200 && statusCode < 300) {
      return response.data;
    }
    final message = response.data['message'] ?? 'Unexpected server error';
    throw Exception('[$statusCode] $message');
  }

  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return AppException('Connection timed out');
      case DioExceptionType.receiveTimeout:
        return AppException('Receive timed out');
      case DioExceptionType.sendTimeout:
        return AppException('Request send timed out');
      case DioExceptionType.badResponse:
        final message =
            e.response?.data['message'] ??
                e.response?.statusMessage ??
                'Unexpected error';
        return AppException(message); // ✅ clean return
      case DioExceptionType.cancel:
        return AppException('Request was cancelled');
      case DioExceptionType.connectionError:
        return AppException('Connection error. Please check your network');
      case DioExceptionType.unknown:
      default:
        return AppException(e.message ?? 'Unexpected error occurred');
    }
  }

  void logFormData(FormData formData) {
    for (var field in formData.fields) {
      print('${field.key}: ${field.value}');
    }
    for (var file in formData.files) {
      print('${file.key}: ${file.value.filename}');
    }
  }
}

class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}
