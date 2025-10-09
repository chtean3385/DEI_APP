import 'package:dei_champions/models/gen-z/genz_growth_model.dart';
import 'package:dei_champions/service/gen-z/genz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/genz/genz_growth_state.dart';

class GenZGrowthSectionController extends StateNotifier<GenZGrowthState> {
  final GenZService _service = GenZService();

  GenZGrowthSectionController() : super(GenZGrowthState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.genZGrowthPoints();
      final Data = (result["data"] as List)
          .map((e) => GenZGrowthModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch genZGrowthPoints  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
