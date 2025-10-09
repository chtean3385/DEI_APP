import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class DisabilityService {
  final ApiHandler _apiHandler;

  DisabilityService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> getDisabilityTitleDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.disabilityTitleDetails,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getDisabilityInclusionSteps() async {
    final result = await _apiHandler.get(
      url: ApiUrls.disabilityInclusionSteps,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getDisabilityBottomDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.disabilityBottomDetails,
      includeAuthToken: true,
    );
    return result;
  }

}
