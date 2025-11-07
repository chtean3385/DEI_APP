import 'dart:async';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/state_models/home/friendly_industries_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/home/friendly_industries/friendly_industry_model.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';




class FriendlyIndustryController extends StateNotifier<FriendlyIndustryState> {
  FriendlyIndustryController() : super(FriendlyIndustryState.initial()) {
    fetchData();
  }

  final JobCategoryService _jobCategoryService = JobCategoryService();



  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getFriendlyIndustries();
      final Data = (result as List)
          .map((e) => IndustryModel.fromJson(e))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch  FriendlyIndustryController fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }



}
