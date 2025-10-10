import 'package:dei_champions/models/defense_veteran/dv_title_model.dart';
import 'package:dei_champions/service/veteran/veteran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/veteran/veteran_title_state.dart';

class VeteranTitleSectionController extends StateNotifier<VeteranTitleState> {
  final VeteranService _service = VeteranService();

  VeteranTitleSectionController() : super(VeteranTitleState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.veteranTitleDetails();
      final Data = (result["data"] as List)
          .map((e) => VeteranTitleModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch veteranTitleDetails  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
