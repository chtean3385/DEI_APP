import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class VeteranService {
  final ApiHandler _apiHandler;

  VeteranService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> veteranTitleDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.veteranTitleDetails,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> veteranAdvantages() async {
    final result = await _apiHandler.get(
      url: ApiUrls.veteranAdvantages,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> veteranQuotes() async {
    final result = await _apiHandler.get(
      url: ApiUrls.veteranQuotes,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> veteranOrganizationalBenefits() async {
    final result = await _apiHandler.get(
      url: ApiUrls.veteranOrganizationalBenefits,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> veteranRoles() async {
    final result = await _apiHandler.get(
      url: ApiUrls.veteranRoles,
      includeAuthToken: true,
    );
    return result;
  }

}
