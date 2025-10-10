import 'package:dei_champions/service/lgbtq/lgbtq_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/ShineWithPride/inclusion_points_model.dart';
import '../../../models/state_models/lgbtq/lgbtq_inclusion_point_state.dart';

class LgbtqInclusionPointsController extends StateNotifier<LgbtqInclusionPointState> {
  final LgbtqService _service = LgbtqService();

  LgbtqInclusionPointsController() : super(LgbtqInclusionPointState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.lgbtqInclusionPoints();
      final Data = (result as List)
          .map((e) => InclusionPointsModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch lgbtqInclusionPoints  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
