import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/settings/employee_settings_model.dart';
import 'package:dei_champions/models/state_models/settings/employee_settings_state.dart';
import 'package:dei_champions/service/employee_profile/employee_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../providers.dart';

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

      state = state.copyWith(pageState: PageState.success, data: settings);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }

  // -----------------------------
  // UI Toggles directly update state.data
  // -----------------------------
  void toggleNotifications(bool val) {
    if (state.data == null) return;
    final updatedData = state.data!.copyWith(notifications: val);
    state = state.copyWith(data: updatedData);
  }

  void toggleSMS(bool val) {
    if (state.data == null) return;
    final updatedData = state.data!.copyWith(smsAlerts: val);
    state = state.copyWith(data: updatedData);
  }

  void toggleEmailAlert(String field, bool val) {
    if (state.data == null) return;

    final current = state.data!.emailAlerts;
    final updatedEmailAlerts = EmailAlertsModel(
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
      profileAlerts: field == "profileAlerts" ? val : current.profileAlerts,
    );

    final updatedData = state.data!.copyWith(emailAlerts: updatedEmailAlerts);
    state = state.copyWith(data: updatedData);
  }

  void setPrivacyMode(String value) {
    if (state.data == null) return;
    final updatedData = state.data!.copyWith(privacyMode: value);
    state = state.copyWith(data: updatedData);
    updateUserSettings(isFromPrivacy: true);
  }

  // -----------------------------
  // Update settings API
  // -----------------------------
  Future<void> updateUserSettings({bool isFromPrivacy = false}) async {
    state = state.copyWith(updatePageState: PageState.loading);

    try {
      final result = await _service.updateUserSettings(
        emailAlerts: state.data!.emailAlerts,
        notifications: state.data!.notifications,
        privacyMode: state.data!.privacyMode,
        smsAlerts: state.data!.smsAlerts,
      );
      if (isFromPrivacy) {
        Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
        Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
      } else {
        AppNavigator.toBottomBar();
      }

      showSnackBar("Settings updated successfully!");
      state = state.copyWith(updatePageState: PageState.success);
    } catch (e) {
      state = state.copyWith(
        updatePageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }

  // -----------------------------
  // Delete Account API
  // -----------------------------
  Future<void> deleteUserAccount() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.deleteUserAccount();
      showSnackBar(result.message, duration: 5);

      await _ref.read(logoutProvider.notifier).signOut();
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
