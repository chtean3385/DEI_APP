import 'package:dei_champions/models/gen-z/genz_bottom_buttons_model.dart';
import 'package:dei_champions/service/gen-z/genz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/genz/genz_bottom_buttons_state.dart';

class GenZBottomButtonSectionController extends StateNotifier<GenZBottomButtonState> {
  final GenZService _service = GenZService();

  GenZBottomButtonSectionController() : super(GenZBottomButtonState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.genZBottomButtons();
      final Data = (result["data"] as List)
          .map((e) => GenZBottomButtonModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch genZBottomButtons  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
