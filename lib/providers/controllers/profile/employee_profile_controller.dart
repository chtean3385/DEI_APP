import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/enums.dart';
import '../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../models/state_models/profile/employee_profile_state.dart';
import '../../../networks/api_urls.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../providers.dart';

class EmployeeProfileController extends StateNotifier<EmployeeProfileState> {
  final Ref ref;
  EmployeeProfileController(this.ref) : super(EmployeeProfileState.initial()) {
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
      // ------------------------------
// CLEAN EMPTY EXPERIENCE OBJECT
// ------------------------------
      final rawExp = userModel.experience ?? [];

      bool isEmptyExp(ExperienceModel e) =>
          (e.companyName ?? '').isEmpty &&
              (e.position ?? '').isEmpty &&
              e.startDate == null &&
              e.endDate == null &&
              (e.description ?? '').isEmpty;

      final List<ExperienceModel> cleanedExperience =
      (rawExp.length == 1 && isEmptyExp(rawExp.first)) ? [] : rawExp;


// ------------------------------
// CLEAN EMPTY EDUCATION OBJECT
// ------------------------------
      final rawEdu = userModel.education ?? [];

      bool isEmptyEdu(EducationModel e) =>
          (e.degree ?? '').isEmpty &&
              (e.institution ?? '').isEmpty &&
              (e.graduationYear == null || e.graduationYear == 0);

      final List<EducationModel> cleanedEducation =
      (rawEdu.length == 1 && isEmptyEdu(rawEdu.first)) ? [] : rawEdu;


// ------------------------------
// FINAL CLEANED USER MODEL
// ------------------------------
      final fixedModel = userModel.copyWith(
        experience: cleanedExperience,
        education: cleanedEducation,
      );
      ref.read(drawerProfileProvider.notifier).updateProfileData(userModel);
      ref.read(profileCompletionProvider.notifier).getEmployeeProfileCompletionData();
      state = state.copyWith(
        pageState: PageState.success,
        profileData: fixedModel,
      );
      debugPrint("success - getEmployeeProfileData");
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      debugPrint("catch - getEmployeeProfileData");
      debugPrint(e.toString());
    }
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
class DrawerProfileController extends StateNotifier<EmployeeProfileState> {
  DrawerProfileController() : super(EmployeeProfileState.initial()) {
  }

  final EmployeeProfileService _employeeProfileService =
  EmployeeProfileService();

  @override
  void dispose() {
    debugPrint("🔥 DrawerProfileController disposed");

    super.dispose();
  }

  /// Reset the provider to initial state
  void clearState() {
    state = EmployeeProfileState.initial();
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
