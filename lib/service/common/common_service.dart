import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class CommonService {
  final ApiHandler _apiHandler;

  CommonService({ApiHandler? apiHandler})
      : _apiHandler = apiHandler ?? ApiHandler();



  Future<BaseModel> getFooterPageDataData() async {
    String url = await ApiUrls.commonFooterPageData;
    final result = await _apiHandler.get(
      url: url,
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
