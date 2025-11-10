import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';

class EmployeeSimilarJobController extends StateNotifier<JobListState> {
  final String? jobId;
  EmployeeSimilarJobController(this.jobId) : super(JobListState.initial()) {
    if(jobId != null)fetchJobs(jobId!);
  }

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeSimilarJobController disposed");
    super.dispose();
  }


  Future<void> fetchJobs(String jobId) async {
    state = state.copyWith(
      pageState: PageState.loading,
    );

    try {
      final BaseModel result = await _jobService.getSimilarJobs(jobId: jobId);
      final userId = await SharedPreferenceRepository.getUserId();
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJsonSimilarJobs(e,currentUserId: userId))
          .toList();
      print( state.data?.length);
      state = state.copyWith(
        pageState: PageState.success,
        data: Data,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }




  void updateJobStatus({
    required String jobId,
    bool? isApplied,
    bool? isSaved,
  }) {
    if (state.data == null || state.data!.isEmpty) return;

    // Find job index by ID
    final index = state.data!.indexWhere((job) => job.id == jobId);
    if (index == -1) {
      debugPrint("⚠️ Job not found in similar job  list for ID: $jobId");
      return;
    }

    final job = state.data![index];

    // Create a new job object with updated fields
    final updatedJob = job.copyWith(
      isApplied: isApplied ?? job.isApplied,
      isSaved: isSaved ?? job.isSaved,
    );

    // Replace the old job with updated one
    final updatedList = [...state.data!];
    updatedList[index] = updatedJob;

    // Update state
    state = state.copyWith(data: updatedList);

    debugPrint(
      "✅ Job updated in similar job list — jobId: $jobId | "
          "isApplied: ${updatedJob.isApplied} | isSaved: ${updatedJob.isSaved}",
    );
  }


}
