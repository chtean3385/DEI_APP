import 'package:dei_champions/models/home/we_are_hiring/hiring_model.dart';
import 'package:dei_champions/models/state_models/home/we_are_hiring_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class WeAreHiringController extends StateNotifier<WeAreHiringState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  WeAreHiringController(this._ref) : super(WeAreHiringState.initial()) {
    fetchHiringData();
  }

  Future<void> fetchHiringData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getHiringBanner();

      // since API returns a List
      final hiringData = (result as List)
          .map((e) => HiringBannerModel.fromJson(e))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: hiringData);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchHiringData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
