import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/salary_range_model.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../constants/app_strings.dart';
import '../../../models/state_models/job/salary_range_list_state.dart';


class SalaryRangeTypesController extends StateNotifier<SalaryRangeListState> {
  final Ref _ref;
  final JobService _jobService = JobService();

  SalaryRangeTypesController(this._ref) : super(SalaryRangeListState.initial()) {
    fetchSalaryRanges();
  }

  Future<void> fetchSalaryRanges() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _jobService.getSalaryRangeData();

      // since API returns a List
      final salaryTypeData = (result.data as List)
          .map((e) => SalaryRangeModel.fromJson(e))
          .toList();

      state = state.copyWith(
        pageState: PageState.success,
        data: salaryTypeData,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch fetchSalaryRanges -${e.toString()}");
      showSnackBar(AppStrings.somethingWentWrong);
    }
  }
}
