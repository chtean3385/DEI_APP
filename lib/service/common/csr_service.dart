import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class CsrService {
  final ApiHandler _apiHandler;

  CsrService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();



  Future<BaseModel> getCsrBannerData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrBannerDetails);
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
  Future<BaseModel> getObjectivesData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrObjectives);
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
  Future<BaseModel> getCsrFocusPointsData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrFocusPoints);
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
