import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_navigator.dart';
import '../../../constants/enums.dart';
import '../../../models/state_models/job/job_state.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../widgets/others/show_custom_alert_dialog.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeManageJobController extends StateNotifier<JobState> {
  EmployeeManageJobController() : super(JobState.initial()) {}

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 employeeManageJobProvider disposed");
    super.dispose();
  }

  Future<bool> applyJob(BuildContext context, String jobId) async {
    final hasUploadedResume =
    await SharedPreferenceRepository.getHasUploadedResume();

    if (!hasUploadedResume) {
      showCustomAlertDialog(
        context: context,
        title: "Please upload resume",
        message:
        "You need to upload your resume before applying for this job.",
        primaryButtonText: "Upload",
        onPrimaryPressed: () {
          Navigator.pop(context); // Close dialog
          Future.microtask(() {
            AppNavigator.loadEditEmployeeResumeScreen();
          });
        },
        secondaryButtonText: "Cancel",
        onSecondaryPressed: () => Navigator.pop(context),
      );
      return false; // ❌ Don't toggle the button
    }

    try {
      state = state.copyWith(pageState: PageState.loading);
      final BaseModel result =   await _jobService.applyJob(jobId: jobId);
      // 🔹 Update local data — mark job as applied
      final updatedJob = state.data?.copyWith(isApplied: true);

      // 🔹 Update state
      state = state.copyWith(
        pageState: PageState.success,
        data: updatedJob,
      );
      print("✅ Applied for job $jobId");
      return true;
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> unApplyJob(BuildContext context, String jobId) async {
    try {
      state = state.copyWith(pageState: PageState.loading);
     final BaseModel result =   await _jobService.unApplyJob(jobId: jobId);
      // 🔹 Update local data — mark job as applied
      final updatedJob = state.data?.copyWith(isApplied: false);

      // 🔹 Update state
      state = state.copyWith(
        pageState: PageState.success,
        data: updatedJob,
      );
      state = state.copyWith(pageState: PageState.success);
      showSnackBar(result.message);
      print("❌ Unapplied from job $jobId");
      return true;
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  saveJob(String jobId) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await _jobService.saveJob(jobId: jobId);
      state = state.copyWith(pageState: PageState.success);
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }
  unSaveJob(String jobId) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await _jobService.unSaveJob(jobId: jobId);
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
