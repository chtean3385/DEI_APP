import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:dei_champions/service/job/job_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';

class EmployeeAppliedJobsController extends StateNotifier<JobListState> {
  EmployeeAppliedJobsController() : super(JobListState.initial()) {
    // fetchJobs();
  }

  final JobService _jobService = JobService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeAppliedJobsController disposed");
    super.dispose();
  }

  void resetState() {
    state = state.copyWith(status: null, data: [], totalCount: 0);
  }

  Future<void> fetchJobs({String? status}) async {
    state = state.copyWith(
      pageState: PageState.loading,
      status: status,
      currentPage: 1,
      data: [],
    );

    try {
      final BaseModel result = await _jobService.getAppliedJobs(
        page: 1,
        status: state.status == "allApplications"
            ? ""
            : state.status?.toLowerCase(),
      );
      final userId = await SharedPreferenceRepository.getUserId();
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJson(e, currentUserId: userId))
          .toList();
      state = state.copyWith(
        pageState: PageState.success,
        data: Data,
        currentPage: result.currentPage,
        lastPage: result.totalPages,
        totalCount: result.totalJobs,
        status: state.status,
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
      final result = await _jobService.getAppliedJobs(
        page: state.currentPage + 1,
        status: state.status == "All" ? "" : state.status?.toLowerCase(),
      );
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJson(e))
          .toList();
      state = state.copyWith(
        data: [...?state.data, ...Data],
        currentPage: result.currentPage,
        lastPage: result.totalPages,
        isLoadingMore: false,
        totalCount: result.totalJobs,
        status: state.status,
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
