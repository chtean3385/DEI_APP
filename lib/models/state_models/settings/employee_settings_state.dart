import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/settings/employee_settings_model.dart';


class EmployeeSettingsState {
  final PageState pageState;
  final EmployeeSettingsModel? data;
  final String? errorMessage;

  // UI Editable Fields
  final bool notifications;
  final bool smsAlerts;
  final String privacyMode;
  final EmailAlertsModel emailAlerts;

  EmployeeSettingsState({
    required this.pageState,
    this.data,
    this.errorMessage,
    required this.notifications,
    required this.smsAlerts,
    required this.privacyMode,
    required this.emailAlerts,
  });

  factory EmployeeSettingsState.initial() => EmployeeSettingsState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    notifications: false,
    smsAlerts: false,
    privacyMode: "",
    emailAlerts: EmailAlertsModel(
      jobAlerts: false,
      estimateAlerts: false,
      invoiceAlerts: false,
      serviceAlerts: false,
      serviceExpiredAlerts: false,
      jobApplicationAlerts: false,
      profileAlerts: false,
    ),
  );

  EmployeeSettingsState copyWith({
    PageState? pageState,
    EmployeeSettingsModel? data,
    String? errorMessage,
    bool? notifications,
    bool? smsAlerts,
    String? privacyMode,
    EmailAlertsModel? emailAlerts,
  }) {
    return EmployeeSettingsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      notifications: notifications ?? this.notifications,
      smsAlerts: smsAlerts ?? this.smsAlerts,
      privacyMode: privacyMode ?? this.privacyMode,
      emailAlerts: emailAlerts ?? this.emailAlerts,
    );
  }
}

