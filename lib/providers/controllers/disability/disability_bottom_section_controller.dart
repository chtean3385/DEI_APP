import 'package:dei_champions/models/disability/disability_bottom_details_model.dart';
import 'package:dei_champions/models/state_models/disability/disability_bottom_state.dart';
import 'package:dei_champions/service/not_defined_by_disability/disability_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class DisabilityBottomSectionController extends StateNotifier<DisabilityBottomState> {
  final DisabilityService _service = DisabilityService();

  DisabilityBottomSectionController() : super(DisabilityBottomState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getDisabilityBottomDetails();
      final Data = (result as List)
          .map((e) => DisabilityBottomDetailModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getDisabilityBottomDetails  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
