import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class SearchService {
  final ApiHandler _apiHandler;

  SearchService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  /// Get filtered & searched jobs
  Future<BaseModel> getSearchJobs({
    int page = 1,
    String? search,
    String? state,
    String? categoryId,
    String? sortBy,
    String? jobTypeId,
    String? industryId,
    String? salaryRangeId,
  }) async {
    try {
      // Start with base URL
      String url = "${ApiUrls.searchJob}";

      // Collect query parameters dynamically
      Map<String, String> queryParams = {};
      queryParams["page"] = page.toString();
      queryParams["limit"] = "10";

      if (search?.isNotEmpty == true) {
        queryParams["keyword"] = search!;
      }
      if (state?.isNotEmpty == true) {
        queryParams["state"] = state!;
      }
      if (categoryId?.isNotEmpty == true) {
        queryParams["categoryId"] = categoryId!;
      }
      if (sortBy?.isNotEmpty == true) {
        queryParams["sortby"] = sortBy!;
      }
      if (jobTypeId?.isNotEmpty == true) {
        queryParams["Jobtype"] = jobTypeId!;
      }
      if (industryId?.isNotEmpty == true) {
        queryParams["Industry"] = industryId!;
      }
      if (salaryRangeId?.isNotEmpty == true) {
        queryParams["salaryrange"] = salaryRangeId!;
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
          throw base.message ?? 'Request failed';
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      rethrow;
    }
  }

}
