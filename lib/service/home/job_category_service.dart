import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class JobCategoryService {
  final ApiHandler _apiHandler;

  JobCategoryService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  Future<dynamic> getCategoryData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.jobCategoryData,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getJobServicesData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.jobServicesData,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getHiringBanner() async {
    final result = await _apiHandler.get(
      url: ApiUrls.weAreHiringData,
      includeAuthToken: true,
    );
    return result;
  }

}
