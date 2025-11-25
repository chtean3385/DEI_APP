import 'package:dei_champions/models/home/how_it_works/how_it_works_response_model.dart';
import 'package:dei_champions/models/state_models/home/how_it_works_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_strings.dart';
import '../../../../constants/enums.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class HowItWorksController extends StateNotifier<HowItWorkState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  HowItWorksController(this._ref) : super(HowItWorkState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getHowItWorks();
      final Data = (result as List)
          .map((e) => HowItWorksResponse.fromJson(e))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchData -${e.toString()}");
      showSnackBar(AppStrings.somethingWentWrong);
    }
  }
}
