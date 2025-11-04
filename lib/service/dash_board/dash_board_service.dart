import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class DashBoardService {
  final ApiHandler _apiHandler;

  DashBoardService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<BaseModel> getDashBoardData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.employeeDashBoardData,
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
