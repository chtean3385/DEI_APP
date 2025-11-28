import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/settings/employee_settings_model.dart';


class EmployeeSettingsState {
  final PageState pageState;
  final PageState updatePageState;
  final EmployeeSettingsModel? data;
  final String? errorMessage;



  EmployeeSettingsState({
    required this.pageState,
    required this.updatePageState,
    this.data,
    this.errorMessage,

  });

  factory EmployeeSettingsState.initial() => EmployeeSettingsState(
    pageState: PageState.initial,
    updatePageState: PageState.initial,
    data: null,
    errorMessage: null,

  );

  EmployeeSettingsState copyWith({
    PageState? pageState,
    PageState? updatePageState,
    EmployeeSettingsModel? data,
    String? errorMessage,

  }) {
    return EmployeeSettingsState(
      pageState: pageState ?? this.pageState,
      updatePageState: updatePageState ?? this.updatePageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

