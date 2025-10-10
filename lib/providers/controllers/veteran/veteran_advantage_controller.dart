import 'package:dei_champions/models/defense_veteran/dv_advantages_model.dart';
import 'package:dei_champions/service/veteran/veteran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/veteran/veteran_advantag_state.dart';

class VeteranAdvantageSectionController extends StateNotifier<VeteranAdvantageState> {
  final VeteranService _service = VeteranService();

  VeteranAdvantageSectionController() : super(VeteranAdvantageState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.veteranAdvantages();
      final Data = (result["data"] as List)
          .map((e) => VeteranAdvantageModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch veteranAdvantages  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
