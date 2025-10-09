import 'package:dei_champions/service/gen-z/genz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/gen-z/genz_advantages_model.dart';
import '../../../models/state_models/genz/genz_advantages_state.dart';

class GenZAdvantagesSectionController extends StateNotifier<GenZAdvantagesState> {
  final GenZService _service = GenZService();

  GenZAdvantagesSectionController() : super(GenZAdvantagesState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.genZAdvantages();
      final Data = (result["data"] as List)
          .map((e) => GenZAdvantageModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch genZAdvantages  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
