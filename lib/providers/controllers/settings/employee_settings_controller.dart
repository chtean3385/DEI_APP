import 'package:dei_champions/models/settings/employee_settings_model.dart';
import 'package:dei_champions/models/state_models/settings/employee_settings_state.dart';
import 'package:dei_champions/service/employee_profile/employee_profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';


class EmployeeSettingsController extends StateNotifier<EmployeeSettingsState> {
  final Ref _ref;
  final EmployeeProfileService _service = EmployeeProfileService();

  EmployeeSettingsController(this._ref) : super(EmployeeSettingsState.initial()) {
    fetchData();
  }

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
      debugPrint(" catch fetchData user settings -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
