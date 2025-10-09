import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class GenZService {
  final ApiHandler _apiHandler;

  GenZService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> genZTitleDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.genZTitleDetails,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> genZGrowthPoints() async {
    final result = await _apiHandler.get(
      url: ApiUrls.genZGrowthPoints,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> genZAdvantages() async {
    final result = await _apiHandler.get(
      url: ApiUrls.genZAdvantages,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> genZBottomButtons() async {
    final result = await _apiHandler.get(
      url: ApiUrls.genZBottomButtons,
      includeAuthToken: true,
    );
    return result;
  }

}
