import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class MenService {
  final ApiHandler _apiHandler;

  MenService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> getAllyShipMan() async {
    final result = await _apiHandler.get(
      url: ApiUrls.allyShipMan,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getHeroManAsAlies() async {
    final result = await _apiHandler.get(
      url: ApiUrls.heroManAsAlies,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getChampionDiversityMan() async {
    final result = await _apiHandler.get(
      url: ApiUrls.championDiversityMan,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getOrganizationalBenefits() async {
    final result = await _apiHandler.get(
      url: ApiUrls.organizationalBenefits,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getWhyAllShipMan() async {
    final result = await _apiHandler.get(
      url: ApiUrls.whyAllShipMan,
      includeAuthToken: true,
    );
    return result;
  }

}
