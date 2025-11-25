import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/models/defense_veteran/dv_advantages_model.dart';
import 'package:dei_champions/models/on_board/on_board_model.dart';
import 'package:dei_champions/models/state_models/on_boarding_state.dart';
import 'package:dei_champions/service/on_boarding_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class OnBoardingController extends StateNotifier<OnBoardingState> {
  final OnBoardingService _service = OnBoardingService();

  OnBoardingController() : super(OnBoardingState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.onBoarding();
      final Data = (result["data"] as List)
          .map((e) => OnBoardModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch OnBoardingController  fetchData -${e.toString()}");
      showSnackBar(AppStrings.somethingWentWrong);
    }
  }
}
