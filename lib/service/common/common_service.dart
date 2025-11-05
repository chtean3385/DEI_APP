import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class CommonService {
  final ApiHandler _apiHandler;

  CommonService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  Future<BaseModel> getHtmlPageContent(String pageName) async {
    String url = await ApiUrls.getHtmlPageData(pageName);
    final result = await _apiHandler.get(url: url);
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

  Future<BaseModel> getOurTeamData() async {
    String url = await ApiUrls.employeeOurTeam;
    final result = await _apiHandler.get(url: url);
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
  Future<BaseModel> getFaqData() async {
    String url = await ApiUrls.faq;
    final result = await _apiHandler.get(url: url);
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
  Future<dynamic> getBlogData() async {
    String url = await ApiUrls.blog;
    final result = await _apiHandler.get(url: url);
    return result;
  }
  Future<dynamic> getBlogDetails(String id) async {
    String url = await ApiUrls.getBlogDetails(id);
    final result = await _apiHandler.get(url: url);
    return result;
  }
  Future<BaseModel> letsConnect() async {
    String url = await ApiUrls.employeeOurTeam;
    final result = await _apiHandler.get(url: url);
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
