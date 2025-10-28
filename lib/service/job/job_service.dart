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
}
