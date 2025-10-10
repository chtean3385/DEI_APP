import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class LgbtqService {
  final ApiHandler _apiHandler;

  LgbtqService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> lgbtqTitleDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.lgbtqTitleDetails,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> lgbtqAdvantages() async {
    final result = await _apiHandler.get(
      url: ApiUrls.lgbtqAdvantages,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> lgbtqQuotes() async {
    final result = await _apiHandler.get(
      url: ApiUrls.lgbtqQuotes,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> lgbtqInclusionPoints() async {
    final result = await _apiHandler.get(
      url: ApiUrls.lgbtqInclusionPoints,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> lgbtqQuotes2() async {
    final result = await _apiHandler.get(
      url: ApiUrls.lgbtqQuotes2,
      includeAuthToken: true,
    );
    return result;
  }

}
