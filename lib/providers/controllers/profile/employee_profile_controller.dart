import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/enums.dart';
import '../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../models/state_models/profile/employee_profile_state.dart';
import '../../../networks/api_urls.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeProfileController extends StateNotifier<EmployeeProfileState> {
  EmployeeProfileController() : super(EmployeeProfileState.initial()) {
    getEmployeeProfileData();
  }

  final EmployeeProfileService _employeeProfileService =
      EmployeeProfileService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeProfileController disposed");

    super.dispose();
  }


  /// 🔹 Call this to employee profile  data from API call
  Future<void> getEmployeeProfileData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _employeeProfileService.getEmployeeProfileDetails();
      final EmployeeUserModel userModel = await EmployeeUserModel.fromJson(
        result,
      );

      state = state.copyWith(
        pageState: PageState.success,
        profileData: userModel,
      );
      debugPrint("success - getEmployeeProfileData");
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - getEmployeeProfileData");
      debugPrint(e.toString());
    }
  }
  ///update locally
  void updateProfileData(EmployeeUserModel data) {
    state = state.copyWith(profileData: data);
  }
}

Future<void> viewResumeFromUrl(String? url) async {
  if (url == null || url.trim().isEmpty) {
    showSnackBar("Resume URL is missing.");
    return;
  }

  // Ensure full URL
  String fullUrl = url.startsWith('http') ? url : '${ApiUrls.baseUrl}$url';

  print("Opening resume URL: $fullUrl");

  try {
    final uri = Uri.tryParse(fullUrl);

    if (uri == null || !(uri.isAbsolute)) {
      showSnackBar("Invalid resume link.");
      return;
    }

    final canLaunch = await canLaunchUrl(uri);
    if (!canLaunch) {
      showSnackBar("Unable to open resume link.");
      return;
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    debugPrint("Error opening resume: $e");
    showSnackBar("Failed to open resume. Please try again.");
  }


}
