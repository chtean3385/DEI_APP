import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class JobService {
  final ApiHandler _apiHandler;

  JobService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  applyJob({required String jobId}) async {
    final result = await _apiHandler.post(
      url: ApiUrls.applyJob(jobId),
      includeAuthToken: true,
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
  unApplyJob({required String jobId}) async {
    final result = await _apiHandler.post(
      url: ApiUrls.unApplyJob(jobId),
      includeAuthToken: true,
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
  saveJob({required String jobId}) async {
    final result = await _apiHandler.post(
      url: ApiUrls.saveJob(jobId),
      includeAuthToken: true,
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
  unSaveJob({required String jobId}) async {
    final result = await _apiHandler.post(
      url: ApiUrls.unSaveJob(jobId),
      includeAuthToken: true,
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

  getJobDetails({required String jobId}) async {
    final result = await _apiHandler.get(
      url: ApiUrls.jobDetails(jobId),
      includeAuthToken: true,
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

  /// Get filtered & searched jobs
  Future<BaseModel> getSavedJobs({
    int page = 1,
  }) async {
    try {
      // Start with base URL
      String url = ApiUrls.savedJobs;

      // Collect query parameters dynamically
      Map<String, String> queryParams = {};
      queryParams["page"] = page.toString();
      queryParams["limit"] = "10";


      // Append query params if any
      if (queryParams.isNotEmpty) {
        final uri = Uri.parse(url).replace(queryParameters: queryParams);
        url = uri.toString();
      }

      // Perform the GET request
      final result = await _apiHandler.get(url: url, includeAuthToken: true);

      // Handle the API response
      if (result is Map<String, dynamic>) {
        final base = BaseModel.fromJson(result);
        if (base.isSuccess) {
          return base;
        } else {
          throw base.message ;
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Get AppliedJobs jobs
  Future<BaseModel> getAppliedJobs({
    int page = 1,
    String? status,
  }) async {
    try {
      // Start with base URL
      String url = ApiUrls.appliedJobs;

      // Collect query parameters dynamically
      Map<String, String> queryParams = {};
      queryParams["page"] = page.toString();
      queryParams["limit"] = "10";

      if (status?.isNotEmpty == true) {
        queryParams["status"] = status!;
      }

      // Append query params if any
      if (queryParams.isNotEmpty) {
        final uri = Uri.parse(url).replace(queryParameters: queryParams);
        url = uri.toString();
      }

      // Perform the GET request
      final result = await _apiHandler.get(url: url, includeAuthToken: true);

      // Handle the API response
      if (result is Map<String, dynamic>) {
        final base = BaseModel.fromJson(result);
        if (base.isSuccess) {
          return base;
        } else {
          throw base.message;
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      rethrow;
    }
  }


  getTypesData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.jobTypes,
      includeAuthToken: true,
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
  getCountryListData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.countryList,
      includeAuthToken: true,
    );
    return result;
  }
}
