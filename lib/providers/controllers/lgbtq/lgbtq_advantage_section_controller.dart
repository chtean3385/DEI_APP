import 'package:dei_champions/models/ShineWithPride/lgbtq_advantages_model.dart';
import 'package:dei_champions/service/lgbtq/lgbtq_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/lgbtq/lgbtq_advantages_state.dart';

class LgbtqAdvantagesSectionController extends StateNotifier<LgbtqAdvantagesState> {
  final LgbtqService _service = LgbtqService();

  LgbtqAdvantagesSectionController() : super(LgbtqAdvantagesState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.lgbtqAdvantages();
      final Data = (result["data"] as List)
          .map((e) => LgbtqAdvantageModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch lgbtqAdvantages  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
