import 'package:dei_champions/models/common/blog_model.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../service/common/common_service.dart';

class BlogController extends StateNotifier<BlogState> {
  final CommonService _service = CommonService();

  BlogController() : super(BlogState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(
      pageState: PageState.loading,
      currentPage: 1,
      data: [],
    );
    try {
      final BaseModel result = await _service.getBlogData(page: 1);
      final Data = (result.data as List)
          .map((e) => BlogModel.fromJson(e)).toList();
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
      final result = await _service.getBlogData(
        page: state.currentPage + 1,
      );
      final Data = (result.data as List)
          .map((e) => BlogModel.fromJson(e))
          .toList();
      state = state.copyWith(
          data: [...?state.data, ...Data],
          currentPage: result.currentPage,
          lastPage: result.totalPages,
          isLoadingMore: false,
          totalCount: result.count
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false);
    }
  }
}
