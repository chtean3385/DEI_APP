import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../service/search/search_service.dart';

class SearchJobController extends StateNotifier<JobListState> {
  SearchJobController() : super(JobListState.initial()) {
    // fetchTopPicks();
  }

  final SearchService _searchService = SearchService();

  @override
  void dispose() {
    debugPrint("🔥 SearchJobController disposed");
    super.dispose();
  }

  /// Fetch dishes for get now/get later

  Future<void> fetchJobs({String? selectedState,String? query,String? sortBy,String? categoryId}) async {
    state = state.copyWith(
      pageState: PageState.loading,
      query : query,
      sortBy: sortBy,
      state: selectedState,
      categoryId: categoryId,
      data: [],
    );

    try {
      final BaseModel result = await _searchService.getSearchJobs(
       categoryId: state.categoryId,
        search:  state.query,
        sortBy:  state.sortBy,
        state:  state.state,
      );
      final Data = (result.data as List)
          .map((e) => JobModelApi.fromJson(e))
          .toList();
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



  /// Load more (pagination)
  // Future<void> loadMore() async {
  //   if (state.isLoadingMore || state.currentPage >= state.lastPage) return;
  //
  //   state = state.copyWith(isLoadingMore: true);
  //
  //   try {
  //     final result = await _searchService.getSearchDishes(
  //       status: state.selectedStatus,
  //       search: state.searchQuery,
  //       page: state.currentPage + 1,
  //     );
  //     final paginatedResponse = PaginatedResponse<SearchFoodModel>.fromJson(
  //       result.data,
  //           (json) => SearchFoodModel.fromJson(json),
  //     );
  //
  //     final foodList = paginatedResponse.items ?? [];
  //     state = state.copyWith(
  //       foods: [...state.foods, ...foodList],
  //       currentPage: paginatedResponse.currentPage,
  //       lastPage: paginatedResponse.lastPage,
  //       isLoadingMore: false,
  //     );
  //   } catch (e) {
  //     state = state.copyWith(isLoadingMore: false);
  //   }
  // }
}
