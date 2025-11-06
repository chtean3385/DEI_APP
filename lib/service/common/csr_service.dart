import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class CsrService {
  final ApiHandler _apiHandler;

  CsrService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();



  Future<BaseModel> getCsrBannerData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrBannerDetails);
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
  Future<BaseModel> getObjectivesData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrObjectives);
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
  Future<BaseModel> getCsrFocusPointsData() async {
    final result = await _apiHandler.get(url: ApiUrls.csrFocusPoints);
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
  Future<BaseModel> getCsrImpactData() async {
    // final result = await _apiHandler.get(url: ApiUrls.csrFocusPoints);
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
  Future<BaseModel> getCsrImpactStoriesData() async {
    // final result = await _apiHandler.get(url: ApiUrls.csrFocusPoints);
    final result = await apiDataImpactStories;
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
  final apiData= {
    "success": true,
    "data": [
      {
        "_id": "690a1234c2b9d5ff12345678",
        "sectionTitle": "Our CSR Impact",
        "subTitle": "Together, we're shaping a future where inclusion drives transformation.",
        "cards": [
          {
            "_id": "690a1234c2b9d5ff12345679",
            "icon": "FaUsers",
            "count": 0,
            "title": "Lives Empowered",
            "subtitle": "through DEI development & mentorship programs"
          },
          {
            "_id": "690a1234c2b9d5ff12345680",
            "icon": "FaHandshake",
            "count": 0,
            "title": "CSR Partnerships",
            "subtitle": "with inclusive & sustainability-driven organizations"
          },
          {
            "_id": "690a1234c2b9d5ff12345681",
            "icon": "FaLeaf",
            "count": 0,
            "title": "Sustainable Projects",
            "subtitle": "completed across India for lasting environmental impact"
          }
        ],
        "status": "Active",
        "createdAt": "2025-11-06T07:42:00.000Z",
        "updatedAt": "2025-11-06T07:42:00.000Z",
        "__v": 0
      }
    ]
  };
  final apiDataImpactStories = {
    "success": true,
    "data": [
      {
        "_id": "690a2345d3c1a6ee98765432",
        "sectionTitle": "Impact Stories",
        "subTitle":
        "Real stories of progress, sustainability, and empowerment through our initiatives.",
        "cards": [
          {
            "_id": "690a2345d3c1a6ee98765433",
            "icon": "FaLaptopCode",
            "count": 0,
            "title": "Digital Literacy for All",
            "subtitle":
            "Our collaboration with local NGOs has enabled over 10,000 students from rural communities to gain digital skills for modern careers.",
            "image":
            "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120375/DEICHAMP/oh6xk6yndlo1ievdxi3y.jpg",
            "read_more_url":
            "https://example.com/stories/digital-literacy"
          },
          {
            "_id": "690a2345d3c1a6ee98765434",
            "icon": "FaTree",
            "count": 0,
            "title": "Greener Workplaces Initiative",
            "subtitle":
            "By planting 50,000 trees and reducing carbon output across partner firms, we’re contributing to India’s sustainability goals.",
            "image":
            "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120375/DEICHAMP/oh6xk6yndlo1ievdxi3y.jpg",
            "read_more_url":
            "https://example.com/stories/greener-workplaces"
          },
          {
            "_id": "690a2345d3c1a6ee98765435",
            "icon": "FaFemale",
            "count": 0,
            "title": "Women Back to Work",
            "subtitle":
            "Our 'ReLaunch' initiative supports women returnees after career breaks with upskilling, mentorship, and remote opportunities.",
            "image":
            "https://res.cloudinary.com/dv4aury9e/image/upload/v1756120375/DEICHAMP/oh6xk6yndlo1ievdxi3y.jpg",
            "read_more_url":
            "https://example.com/stories/women-back-to-work"
          }
        ],
        "status": "Active",
        "createdAt": "2025-11-06T07:42:00.000Z",
        "updatedAt": "2025-11-06T07:42:00.000Z",
        "__v": 0
      }
    ]
  };
}
