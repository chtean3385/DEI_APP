import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/common/base_model.dart';
import '../../../../models/job/job_model_api.dart';
import '../../../../models/state_models/job/job_list_state.dart';
import '../../../../repo/shared_preference_repository.dart';
import '../../../../service/job/job_service.dart';

class EmployerManageJobsController extends StateNotifier<JobListState> {
  EmployerManageJobsController() : super(JobListState.initial()) {
    fetchJobs();
  }

  final JobService _jobService = JobService();
  List<JobModelApi> _allJobs = []; // 🔹 Keep the full list here

  @override
  void dispose() {
    debugPrint("🔥 EmployerManageJobsController disposed");
    super.dispose();
  }

  void resetState() {
    state = state.copyWith(status: null, data: [], totalCount: 0);
    _allJobs = [];
  }

  Future<void> fetchJobs() async {
    state = state.copyWith(
      pageState: PageState.loading,
      data: [],
    );

    try {
      final BaseModel result = await _jobService.getEmployerJobs();
      final userId = await SharedPreferenceRepository.getUserId();
      final jobs = (result.data as List)
          .map((e) => JobModelApi.fromJson(e, currentUserId: userId))
          .toList();

      _allJobs = jobs; // ✅ Save the unfiltered list

      state = state.copyWith(
        pageState: PageState.success,
        data: jobs,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
    }
  }

  void selectFilter(String newStatus) {
    debugPrint("🟡 Selected Filter: $newStatus");
    debugPrint("📦 Total jobs before filter: ${_allJobs.length}");

    List<JobModelApi>? filtered;
    if (newStatus.toLowerCase() == 'all' || newStatus.toLowerCase() == 'totaljobs') {
      filtered = _allJobs;
    } else {
      filtered = _allJobs
          .where((job) => job.status?.toLowerCase() == newStatus.toLowerCase())
          .toList();
    }

    debugPrint("✅ Filtered count: ${filtered.length}");

    state = state.copyWith(
      status: newStatus,
      data: filtered,
    );
  }
}

