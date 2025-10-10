import 'package:dei_champions/models/ShineWithPride/lgbtq_title_detiail_model.dart';
import 'package:dei_champions/service/lgbtq/lgbtq_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/lgbtq/lgbtq_title_state.dart';

class LgbtqTitleSectionController extends StateNotifier<LgbtqTitleState> {
  final LgbtqService _service = LgbtqService();

  LgbtqTitleSectionController() : super(LgbtqTitleState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.lgbtqTitleDetails();
      final Data = (result["data"] as List)
          .map((e) => LgbtqTitleModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch lgbtqTitleDetails  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
