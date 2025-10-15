import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class OnBoardingService {
  final ApiHandler _apiHandler;

  OnBoardingService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  Future<dynamic> onBoarding() async {
    final result = await _apiHandler.get(
      url: ApiUrls.onBoarding,
      includeAuthToken: false,
    );
    return result;
  }
}
