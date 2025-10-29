import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:dei_champions/repo/shared_preference_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../service/search/search_service.dart';

class EmployeeSearchJobController extends StateNotifier<JobListState> {
  EmployeeSearchJobController() : super(JobListState.initial()) {
    // fetchTopPicks();
  }

  final SearchService _searchService = SearchService();

  @override
  void dispose() {
    debugPrint("🔥 EmployeeSearchJobController disposed");
    super.dispose();
  }


  Future<void> fetchJobs({String? selectedState,String? query,String? sortBy,String? categoryId}) async {
    state = state.copyWith(
      pageState: PageState.loading,
      query : query,
      sortBy: sortBy,
      state: selectedState,
      categoryId: categoryId,
      currentPage: 1,
      data: [],
    );

    try {
      final BaseModel result = await _searchService.getSearchJobs(
        page: 1,
       categoryId: state.categoryId,
        search:  state.query,
        sortBy:  state.sortBy,
        state:  state.state,
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
      final result = await _searchService.getSearchJobs(
        categoryId: state.categoryId,
        search:  state.query,
        sortBy:  state.sortBy,
        state:  state.state,
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
}
