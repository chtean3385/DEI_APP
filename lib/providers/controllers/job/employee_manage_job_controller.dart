import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_navigator.dart';
import '../../../constants/enums.dart';
import '../../../models/profile/profile_completion/profile_completion_model.dart';
import '../../../models/state_models/job/job_state.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../ui/pages/home/components/boost/profile_completion_slider.dart';
import '../../../widgets/others/show_custom_alert_dialog.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../../widgets/pickers/show_permission_alert.dart';
import 'employee_similar_jobs_controller.dart';

class EmployeeManageJobController extends StateNotifier<JobState> {
  final Ref ref;

  EmployeeManageJobController(this.ref) : super(JobState.initial()) {}

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 employeeManageJobProvider disposed");
    super.dispose();
  }

  Future<bool> applyJob(BuildContext context, String jobId) async {
    final profileState = ref.read(profileCompletionProvider);

    final List<MissingField> missingData =
        profileState.profileData?.missingFields ?? [];

    // Check if "resume" is one of the missing fields
    final bool hasUploadedResume =
    !missingData.any((field) => field.field == "resume");

    if (!hasUploadedResume) {
      showCustomAlertDialog(
        context: context,
        title: "Please upload resume",
        message: "You need to upload your resume before applying for this job.",
        primaryButtonText: "Upload",
        onPrimaryPressed: () {
          Navigator.pop(context);
          // Close dialog
          Future.microtask(() {
            AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(resume: true) );
          });
        },
        secondaryButtonText: "Cancel",
        onSecondaryPressed: () => Navigator.pop(context),
      );
      return false; // ❌ Don't toggle the button
    }

    try {
      state = state.copyWith(pageState: PageState.loading);
      final BaseModel result = await _jobService.applyJob(jobId: jobId);
      // 🔹 Update local data — mark job as applied

      // 🔹 Update state
      state = state.copyWith(pageState: PageState.success);
      print("✅ Applied for job $jobId");
      // 🔁 Sync  job details in other providers
      updateJobDataLocallyInsideExternalControllers(
        jobId: jobId,
        isApplied: true,
      );

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
      final BaseModel result = await _jobService.unApplyJob(jobId: jobId);
      // 🔹 Update local data — mark job as applied
      final updatedJob = state.data?.copyWith(isApplied: false);

      // 🔹 Update state
      state = state.copyWith(pageState: PageState.success, data: updatedJob);
      state = state.copyWith(pageState: PageState.success);
      showSnackBar(result.message);
      print("❌ Unapplied from job $jobId");
      // 🔁 Sync  job details in other providers
      updateJobDataLocallyInsideExternalControllers(
        jobId: jobId,
        isApplied: false,
      );
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
      print("✅ Saved for job $jobId");
      // 🔁 Sync  job details in other providers
      updateJobDataLocallyInsideExternalControllers(
        jobId: jobId,
        isSaved: true,
      );
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
      print("✅ UnSave for job $jobId");
      // 🔁 Sync  job details in other providers
      updateJobDataLocallyInsideExternalControllers(
        jobId: jobId,
        isSaved: false,
      );
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }

  updateJobDataLocallyInsideExternalControllers({
    required String jobId,
    bool? isApplied,
    bool? isSaved,
  }) {
    final _employeeJobDetailsController = ref.read(
      employeeJobDetailsProvider.notifier,
    );
    final _employeeSearchJobListController = ref.read(
      searchJobListProvider.notifier,
    );
    final _employeeSavedJobListController = ref.read(
      employeeSavedJobsProvider.notifier,
    );
    final _employeeAppliedJobListController = ref.read(
      employeeAppliedJobsProvider.notifier,
    );
    final _employeeSimilarJobListController = ref.read(
      similarJobListProvider(null).notifier,
    );
    final _employeeRecommendedJobListController = ref.read(
      recommendedJobListProvider.notifier,
    );
    if (_employeeJobDetailsController.mounted) {
      _employeeJobDetailsController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
    if (_employeeSearchJobListController.mounted) {
      _employeeSearchJobListController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
    if (_employeeSavedJobListController.mounted) {
      _employeeSavedJobListController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
    if (_employeeAppliedJobListController.mounted) {
      _employeeAppliedJobListController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
    if (_employeeSimilarJobListController.mounted) {
      _employeeSimilarJobListController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
    if (_employeeRecommendedJobListController.mounted) {
      _employeeRecommendedJobListController.updateJobStatus(
        jobId: jobId,
        isApplied: isApplied,
        isSaved: isSaved,
      );
    }
  }


}
