import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/profile/profile_completion/profile_completion_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/state_models/profile/employee_profile_completion_state.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../ui/pages/main/components/drawer/profile_completion_alert.dart';

class EmployeeProfileCompletionController extends StateNotifier<EmployeeProfileCompletionState> {
  EmployeeProfileCompletionController() : super(EmployeeProfileCompletionState.initial()) {
    getEmployeeProfileCompletionData();
  }

  final EmployeeProfileService _employeeProfileService =
  EmployeeProfileService();

  bool _alertShownThisSession = false;

  @override
  void dispose() {
    debugPrint("🔥 EmployeeProfileCompletionController disposed");
    super.dispose();
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
      if (_alertShownThisSession) return;
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
}