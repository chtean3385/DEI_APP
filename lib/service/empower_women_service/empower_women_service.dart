import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class EmpowerWomenService {
  final ApiHandler _apiHandler;

  EmpowerWomenService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> getEmpowerWomenImpact() async {
    final result = await _apiHandler.get(
      url: ApiUrls.empowerWomenImpact,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getEmpowerWomenHero() async {
    final result = await _apiHandler.get(
      url: ApiUrls.empowerWomenHero,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getEmpowerWomenWorkForce() async {
    final result = await _apiHandler.get(
      url: ApiUrls.empowerWomenWorkForce,
      includeAuthToken: true,
    );
    return result;
  }

}
