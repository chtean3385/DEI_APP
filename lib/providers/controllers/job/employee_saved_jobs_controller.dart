import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';

class EmployeeSavedJobController extends StateNotifier<JobListState> {
  EmployeeSavedJobController() : super(JobListState.initial()) {
    fetchJobs();
  }

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeSavedJobController disposed");
    super.dispose();
  }


  Future<void> fetchJobs() async {
    state = state.copyWith(
      pageState: PageState.loading,
      currentPage: 1,
      data: [],
    );

    try {
      final BaseModel result = await _jobService.getSavedJobs(
        page: 1,
      );
      final userId = await SharedPreferenceRepository.getUserId();
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJson(e,currentUserId: userId))
          .toList();
      state = state.copyWith(
        pageState: PageState.success,
        data: Data,
        currentPage: result.currentPage,
        lastPage: result.totalPages,
        totalCount: result.count
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }



  /// Load more (pagination)
  Future<void> loadMore() async {
    if (state.isLoadingMore || state.currentPage >= state.lastPage) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final result = await _jobService.getSavedJobs(
        page: state.currentPage + 1,
      );
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJson(e))
          .toList();
      state = state.copyWith(
        data: [...?state.data, ...Data],
        currentPage: result.currentPage,
        lastPage: result.totalPages,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false);
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
      debugPrint("⚠️ Job not found in saved job  list for ID: $jobId");
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
      "✅ Job updated in saved job list — jobId: $jobId | "
          "isApplied: ${updatedJob.isApplied} | isSaved: ${updatedJob.isSaved}",
    );
  }


}
