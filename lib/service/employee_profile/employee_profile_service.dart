import 'dart:convert';
import 'dart:io';

import 'package:dei_champions/models/profile/employee_user_model/employee_user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class EmployeeProfileService {
  final ApiHandler _apiHandler;

  EmployeeProfileService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  getEmployeeProfileDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.employeeProfileDetails,
      includeAuthToken: true,
    );
    return result;
  }

  /// 🔹 update employee profile data
  Future<BaseModel> updateEmployeeProfileDetails({
    required EmployeeUserModel data,
    required XFile? profileFile,
    required PlatformFile? resumeFile,
  }) async {
    final body = data.toJson();
    final encodedBody = body.map((key, value) {
      if (value == null) return MapEntry(key, '');
      // 🟢 Special handling for preferred locations
      if (key == 'preferredLocations' && value is List<String>) {
        // Convert ["Delhi", "Bangalore"] → ["Delhi,Bangalore"]
        return MapEntry(key, [value.join(',')]);
      }
      if (value is List || value is Map) {
        return MapEntry(key, jsonEncode(value)); // ✅ encode only complex values
      }
      return MapEntry(key, value);
    });
    final result = await _apiHandler.uploadFile(
      url: ApiUrls.updateEmployeeProfileDetails,
      body: encodedBody,
      profileImg: profileFile != null && profileFile.path.isNotEmpty
          ? File(profileFile.path)
          : null,
      resumeFile: resumeFile != null && (resumeFile.path?.isNotEmpty ?? false)
          ? File(resumeFile.path!)
          : null,
    );
    if (result is Map<String, dynamic>) {
      final base = BaseModel.fromJson(result);
      if (base.isSuccess) {
        return base;
      } else {
        throw (base.message);
      }
    } else {
      throw Exception('Invalid response format');
    }
  }
  /// 🔹 get employee profile percentage
  Future<BaseModel> getEmployeeProfilePercentageDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.employeeProfilePercentage,
      includeAuthToken: true
    );
    if (result is Map<String, dynamic>) {
      final base = BaseModel.fromJson(result);
      if (base.isSuccess) {
        return base;
      } else {
        throw (base.message);
      }
    } else {
      throw Exception('Invalid response format');
    }
  }
}
