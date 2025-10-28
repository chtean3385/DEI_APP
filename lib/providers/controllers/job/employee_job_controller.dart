import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/state_models/job/job_state.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeManageJobController extends StateNotifier<JobState> {
  EmployeeManageJobController() : super(JobState.initial()) {}

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 employeeManageJobProvider disposed");
    super.dispose();
  }

  applyJob(String jobId) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await _jobService.applyJob(jobId: jobId);
      state = state.copyWith(pageState: PageState.success);
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }
  unApplyJob(String jobId) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await _jobService.unApplyJob(jobId: jobId);
      state = state.copyWith(pageState: PageState.success);
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }
}
