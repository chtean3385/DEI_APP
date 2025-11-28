import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/settings/employee_settings_model.dart';


class EmployeeSettingsState {
  final PageState pageState;
  final EmployeeSettingsModel? data;
  final String? errorMessage;

  EmployeeSettingsState({required this.pageState, this.data, this.errorMessage});

  factory EmployeeSettingsState.initial() => EmployeeSettingsState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  EmployeeSettingsState copyWith({
    PageState? pageState,
    EmployeeSettingsModel? data,
    String? errorMessage,
  }) {
    return EmployeeSettingsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
