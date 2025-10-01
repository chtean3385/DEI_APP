import 'package:dei_champions/models/home/job_category/job_category_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/state_models/job_category_state.dart';
import '../../../../service/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';


class JobCategoryController extends StateNotifier<JobCategoryState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  JobCategoryController(this._ref) : super(JobCategoryState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getCategoryData();

      // since API returns a List
      final categoryData = (result as List)
          .map((e) => JobCategoryGroup.fromJson(e))
          .toList();

      state = state.copyWith(
        pageState: PageState.success,
        data: categoryData.first,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchCategories -${e.toString()}");
      showSnackBar(e.toString());
    }
  }


  // void selectCategory(String id) {
  //   final selected =
  //   state.data?.firstWhere((c) => c.id == id, orElse: () => null);
  //   state = state.copyWith(selectedCategory: selected);
  // }
  //
  // void clearSelection() {
  //   state = state.copyWith(selectedCategory: null);
  // }
}
