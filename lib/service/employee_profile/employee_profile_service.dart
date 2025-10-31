import '../../models/common/base_model.dart';
import '../../networks/api_handler.dart';
import '../../networks/api_urls.dart';

class EmployeeProfileService {
  final ApiHandler _apiHandler;

  EmployeeProfileService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();



  getEmployeeProfileDetails() async {
    final result = await _apiHandler.get(
      url: ApiUrls.employeeProfileDetails,
      includeAuthToken: true,
    );
    return result;
  }




}
