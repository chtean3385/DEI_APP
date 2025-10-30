import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/state_models/job/job_state.dart';
import '../../../service/job/job_service.dart';
import '../../../widgets/others/snack_bar.dart';

class EmployeeJobDetailsController extends StateNotifier<JobState> {
  EmployeeJobDetailsController() : super(JobState.initial()) {
  }

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeJobDetailsController disposed");
    super.dispose();
  }


  getJobDetails(String jobId) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
     final BaseModel result =  await _jobService.getJobDetails(jobId: jobId);
     final userId = await SharedPreferenceRepository.getUserId();
     final Data = JobModelApi.fromJson(result.data,currentUserId: userId);
      state = state.copyWith(pageState: PageState.success,data: Data);
    } catch (e) {
      showSnackBar(e.toString());
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }
  /// ✅ Allow external controllers to update job data directly
  /// ✅ Update job flags locally (isApplied, isSaved)
  void updateJobStatus({
    required String jobId,
    bool? isApplied,
    bool? isSaved,
  }) {
    final currentJob = state.data;
    if (currentJob == null || currentJob.id != jobId) {
      debugPrint("⚠️ Job not found or mismatched for ID: $jobId");
      return;
    }

    final updatedJob = currentJob.copyWith(
      isApplied: isApplied ?? currentJob.isApplied,
      isSaved: isSaved ?? currentJob.isSaved,
    );

    state = state.copyWith(data: updatedJob);

    debugPrint(
      "✅ Job updated locally — jobId: $jobId | "
          "isApplied: ${updatedJob.isApplied} | isSaved: ${updatedJob.isSaved}",
    );
  }
}
