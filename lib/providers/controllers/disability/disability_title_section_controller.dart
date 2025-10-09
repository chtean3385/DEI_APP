import 'package:dei_champions/models/state_models/disability/disability_title_state.dart';
import 'package:dei_champions/service/not_defined_by_disability/disability_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/disability/disability_title_details_model.dart';

class DisabilityTitleSectionController extends StateNotifier<DisabilityTitleState> {
  final DisabilityService _service = DisabilityService();

  DisabilityTitleSectionController() : super(DisabilityTitleState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getDisabilityTitleDetails();
      final Data = (result as List)
          .map((e) => DisabilityTitleDetailsModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getDisabilityTitleDetails  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
