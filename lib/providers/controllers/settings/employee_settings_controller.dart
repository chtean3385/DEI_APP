import 'package:dei_champions/models/settings/employee_settings_model.dart';
import 'package:dei_champions/models/state_models/settings/employee_settings_state.dart';
import 'package:dei_champions/service/employee_profile/employee_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';


class EmployeeSettingsController extends StateNotifier<EmployeeSettingsState> {
  final Ref _ref;
  final EmployeeProfileService _service = EmployeeProfileService();

  EmployeeSettingsController(this._ref)
      : super(EmployeeSettingsState.initial()) {
    fetchData();
  }

  // -----------------------------
  // Load settings from backend
  // -----------------------------
  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);

    try {
      final result = await _service.getSettingsData();
      final settings = EmployeeSettingsModel.fromJson(result.data);

      state = state.copyWith(
        pageState: PageState.success,
        data: settings,
        privacyMode: settings.privacyMode,
        notifications: settings.notifications,
        smsAlerts: settings.smsAlerts,
        emailAlerts: settings.emailAlerts,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }

  // ------------- UI Toggles -------------
  void toggleNotifications(bool val) {
    state = state.copyWith(notifications: val);
  }

  void toggleSMS(bool val) {
    state = state.copyWith(smsAlerts: val);
  }

  void toggleEmailAlert(String field, bool val) {
    final current = state.data?.emailAlerts;

    if (current == null) return;

    final updated = EmailAlertsModel(
      jobAlerts: field == "jobAlerts" ? val : current.jobAlerts,
      estimateAlerts: field == "estimateAlerts" ? val : current.estimateAlerts,
      invoiceAlerts: field == "invoiceAlerts" ? val : current.invoiceAlerts,
      serviceAlerts: field == "serviceAlerts" ? val : current.serviceAlerts,
      serviceExpiredAlerts: field == "serviceExpiredAlerts"
          ? val
          : current.serviceExpiredAlerts,
      jobApplicationAlerts: field == "jobApplicationAlerts"
          ? val
          : current.jobApplicationAlerts,
      profileAlerts:
      field == "profileAlerts" ? val : current.profileAlerts,
    );

    final updatedData =
    state.data!.copyWith(emailAlerts: updated);

    state = state.copyWith(data: updatedData);
  }


  void setPrivacyMode(String value) {
    state = state.copyWith(privacyMode: value);
  }

  // -----------------------------
  // Update settings API
  // -----------------------------
  Future<void> updateUserSettings() async {
    state = state.copyWith(pageState: PageState.loading);


    try {
      final result = await _service.updateUserSettings(
        emailAlerts:state.emailAlerts,
        notifications:state.notifications,
        privacyMode:state.privacyMode ,
        smsAlerts: state.smsAlerts,

      );

      showSnackBar("Settings updated successfully!");
      state = state.copyWith(pageState: PageState.success);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }
}

