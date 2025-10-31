import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_type_model.dart';
import 'package:dei_champions/models/state_models/job/job_type_list_state.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';


class JobTypesController extends StateNotifier<JobTypeListState> {
  final Ref _ref;
  final JobService _jobService = JobService();

  JobTypesController(this._ref) : super(JobTypeListState.initial()) {
    fetchJobTypes();
  }

  Future<void> fetchJobTypes() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _jobService.getTypesData();

      // since API returns a List
      final jobTypeData = (result.data as List)
          .map((e) => JobTypeModel.fromJson(e))
          .toList();

      state = state.copyWith(
        pageState: PageState.success,
        data: jobTypeData,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch fetchJobTypes -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
