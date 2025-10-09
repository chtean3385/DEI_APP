import 'package:dei_champions/models/disability/disability_inclusion_steps_model.dart';
import 'package:dei_champions/models/state_models/disability/disability_inclusion_steps_state.dart';
import 'package:dei_champions/service/not_defined_by_disability/disability_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class DisabilityInclusionStepsController extends StateNotifier<DisabilityInclusionStepsState> {
  final DisabilityService _service = DisabilityService();

  DisabilityInclusionStepsController() : super(DisabilityInclusionStepsState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getDisabilityInclusionSteps();
      final Data = (result as List)
          .map((e) => DisabilityInclusionStepsModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getDisabilityInclusionSteps  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
