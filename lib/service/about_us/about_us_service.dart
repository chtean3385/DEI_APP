import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class AboutUsService {
  final ApiHandler _apiHandler;

  AboutUsService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();


  Future<dynamic> getWhatWeDoData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.whatWeDoData,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getAboutUsData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.aboutUs,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getAboutVisionMissionData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.aboutVisionMission,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getCoreValueData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.aboutCoreValues,
      includeAuthToken: true,
    );
    return result;
  }
  Future<dynamic> getRevolutionData() async {
    final result = await _apiHandler.get(
      url: ApiUrls.revolutionData,
      includeAuthToken: true,
    );
    return result;
  }

}
