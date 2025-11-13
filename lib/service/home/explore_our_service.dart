import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class CareerExploreServices {
  final ApiHandler _apiHandler;

  CareerExploreServices({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<BaseModel> getOurServices() async {
    String url = await ApiUrls.exploreOurServices;
    final result = await _apiHandler.get(url: url);
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
