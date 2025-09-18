import '../models/common/base_model.dart';
import '../networks/api_handler.dart';
import '../networks/api_urls.dart';

class AuthService {
  final ApiHandler _apiHandler;

  AuthService({ApiHandler? apiHandler})
    : _apiHandler = apiHandler ?? ApiHandler();

  Future<BaseModel> employeeSignUp({
    required String name,
    required String email,
    required String password,
    required String mobile,
    required String workStatus,
    required bool acceptTerms,
    required int roleId,
  }) async {
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'workStatus': workStatus,
      'acceptTerms': acceptTerms,
      'roleId': roleId,
    };
    final result = await _apiHandler.post(url: ApiUrls.employeeSignup, body: body, includeAuthToken: false,);
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

  Future<BaseModel> verifyOtp({required String phone, required int otp}) async {
    final body = {'phone_number': phone, 'otp': otp};

    final result = await _apiHandler.post(
      url: ApiUrls.verifyOtp,
      body: body,
      includeAuthToken: false,
    );

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

  Future<BaseModel> employeeSignIn({required String email,required String password}) async {
    final body = {'email': email,"password":password};

    final result = await _apiHandler.post(url: ApiUrls.signIn, body: body);

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

  Future<BaseModel> resendOtp({required String phoneNumber}) async {
    final body = {'phone_number': phoneNumber};
    final result = await _apiHandler.post(
      url: ApiUrls.resendOtp,
      body: body,
      includeAuthToken: false,
    );
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
