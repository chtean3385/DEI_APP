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
  Future<BaseModel> getBlogData({
    int page = 1,
  }) async {
    try {
      // Start with base URL
      String url = ApiUrls.blog;

      // Collect query parameters dynamically
      Map<String, String> queryParams = {};
      queryParams["page"] = page.toString();
      queryParams["limit"] = "10";


      // Append query params if any
      if (queryParams.isNotEmpty) {
        final uri = Uri.parse(url).replace(queryParameters: queryParams);
        url = uri.toString();
      }

      // Perform the GET request
      final result = await _apiHandler.get(url: url, includeAuthToken: true);

      // Handle the API response
      if (result is Map<String, dynamic>) {
        final base = BaseModel.fromJson(result);
        if (base.isSuccess) {
          return base;
        } else {
          throw base.message ;
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getBlogDetails(String id) async {
    String url = await ApiUrls.getBlogDetails(id);
    final result = await _apiHandler.get(url: url);
    return result;
  }
  Future<BaseModel> getPlanPriceData() async {
    // String url = await ApiUrls.faq;
    // final result = await _apiHandler.get(url: url);
    final result = await apiData;
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
  Future<BaseModel> letsConnect({
    required String firstName,
    required String lastName,
    required String organisation,
    required String designation,
    required String phone,
    required String interest,
    required String email,
    required String query,
  }) async {
    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'organisation': organisation,
      'designation': designation,
      'phone': phone,
      'captcha': true,
      'email': email,
      'interest': interest,
      'query': query,
    };
    final result = await _apiHandler.post(url: ApiUrls.contactUs, body: body, includeAuthToken: false,);
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
  Future<BaseModel> getStateCityData() async {
    String url = await ApiUrls.countryList;
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

  final apiData = {
    "success": true,
    "data": [
      {
        "id": "starter",
        "name": "Starter",
        "price": 0,
        "currency": "INR",
        "billingCycle": "month",
        "description": "Perfect for testing our platform",
        "features": [
          "1 job posting per month",
          "14–day listing duration",
          "Basic company profile",
          "Up to 50 applications",
          "Standard support"
        ],
        "ctaText": "Get Started"
      },
      {
        "id": "professional",
        "name": "Professional",
        "price": 16599,
        "currency": "INR",
        "billingCycle": "month",
        "description": "For growing companies with regular hiring needs",
        "features": [
          "5 active job postings",
          "30–day listing duration",
          "Featured job listings",
          "Advanced candidate filtering",
          "Candidate messaging"
        ],
        "ctaText": "Choose Plan"
      },
      {
        "id": "enterprise",
        "name": "Enterprise",
        "price": 41599,
        "currency": "INR",
        "billingCycle": "month",
        "description": "For large organizations with high-volume hiring",
        "features": [
          "Unlimited job postings",
          "Priority placement",
          "AI-powered candidate matching",
          "Dedicated account manager",
          "Custom branding & analytics"
        ],
        "ctaText": "Choose Plan"
      }
    ]
  };

}
