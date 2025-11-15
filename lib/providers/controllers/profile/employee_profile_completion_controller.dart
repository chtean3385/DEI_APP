import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/profile/profile_completion/profile_completion_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../constants/app_keys.dart';
import '../../../constants/enums.dart';
import '../../../models/home/tutorial_model.dart';
import '../../../models/state_models/profile/employee_profile_completion_state.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../service/tutorial_service.dart';
import '../../../ui/pages/main/components/drawer/profile_completion_alert.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeProfileCompletionController extends StateNotifier<EmployeeProfileCompletionState> {
  EmployeeProfileCompletionController() : super(EmployeeProfileCompletionState.initial()) {
  }

  final EmployeeProfileService _employeeProfileService =
  EmployeeProfileService();

  bool _alertShownThisSession = false;

  @override
  void dispose() {
    debugPrint("🔥 EmployeeProfileCompletionController disposed");
    super.dispose();
  }
  void clearState() {
    state = EmployeeProfileCompletionState.initial();
  }


  /// 🔹 Call this to employee profile  data from API call
  Future<void> getEmployeeProfileCompletionData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _employeeProfileService.getEmployeeProfilePercentageDetails();
      final ProfileCompletionModel profileCompletionModel = await ProfileCompletionModel.fromJson(
        result.data,
      );
      state = state.copyWith(
        pageState: PageState.success,
        profileData: profileCompletionModel,
      );
      if (_alertShownThisSession)  return;
      final missing = state.profileData?.missingFieldsCount ?? 0;
      if (missing == 0) return;
      // 🚀 Mark as shown BEFORE showing alert
      _alertShownThisSession = true;
      showProfileAlert(navigatorKey.currentContext!,state.profileData?.missingFields);
      debugPrint("success - getEmployeeProfileCompletionData");
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      debugPrint("catch - getEmployeeProfileCompletionData");
      debugPrint(e.toString());
    }
  }
  resendEmailVerification() async {
    state = state.copyWith(verifyEmailPageState: PageState.loading);
    try {
     final BaseModel result  = await _employeeProfileService.sendEmailVerification();
      state = state.copyWith(verifyEmailPageState: PageState.success);
      showSnackBar(result.message);
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
      );
    }
  }
  /// Show DEI Job Portal tutorial

}
showHomeTutorial(BuildContext context) async {
  bool? isTutorialShown = await SharedPreferenceRepository.getHomeTutorialShown();
  debugPrint("showHomeTutorial --> $isTutorialShown");
  if (isTutorialShown != true) {
    final TutorialService _tutorialService = TutorialService();
    Future.delayed(Duration.zero, () {
      _tutorialService.createTutorial(
        context: context,
        alignSkip: Alignment.centerRight,
        items: [
          TargetItem(
            id: "searchFieldKey",
            key: AppTutorialKeys.searchButtonKey,
            title: "Search Jobs",
            description:
            "Use this field to search for job titles, keywords, or companies. Find the best DEI job opportunities that match your skills.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.bottom,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          TargetItem(
            id: "notificationButtonKey",
            key: AppTutorialKeys.notificationButtonKey,
            title: "Notifications",
            description:
            "Tap here to view updates about new job postings, application status, and important DEI announcements.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.bottom,
            shape: const CircleBorder(),
          ),


          TargetItem(
            id: "homeButtonKey",
            key: AppTutorialKeys.homeButtonKey,
            title: "Home",
            description:
            "Discover the latest job postings, DEI initiatives, and opportunities tailored to your career goals.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.top,
            shape: const CircleBorder(),
          ),
          TargetItem(
            id: "appliedButtonKey",
            key: AppTutorialKeys.appliedButtonKey,
            title: "Applied Jobs",
            description:
            "View all the jobs you've applied to, track your application status, and follow up with potential employers.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.top,
            shape: const CircleBorder(),
          ),
          TargetItem(
            id: "savedButtonKey",
            key: AppTutorialKeys.savedButtonKey,
            title: "Saved Jobs",
            description:
            "Save interesting job postings to apply later or keep track of roles you are interested in.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.top,
            shape: const CircleBorder(),
          ),
          TargetItem(
            id: "profileButtonKey",
            key: AppTutorialKeys.profileButtonKey,
            title: "Profile",
            description:
            "Manage your account, update personal and professional details, and highlight your DEI experience.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.top,
            shape: const CircleBorder(),
          ),
          TargetItem(
            id: "dashBoardButtonKey",
            key: AppTutorialKeys.dashBoardButtonKey,
            title: "Dashboard",
            description:
            "Access analytics of your applications, recommended jobs, and your engagement with DEI initiatives.",
            tapText: "Tap on the icon to continue",
            align: ContentAlign.top,
            shape: const CircleBorder(),
          ),
        ],
        onFinish: () => debugPrint("DEI Job Portal Tutorial finished"),
        onSkip: () => debugPrint("DEI Job Portal Tutorial skipped"),
      );

      _tutorialService.showTutorial(context);
    });

    // ✅ Save that tutorial has been shown
    await SharedPreferenceRepository.setHomeTutorialShown(true);
  }
}