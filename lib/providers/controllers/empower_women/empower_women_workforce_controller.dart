import 'package:dei_champions/models/empower_women/empower_women_workforce_model.dart';
import 'package:dei_champions/models/state_models/empower_women/empower_women_workforce_state.dart';
import 'package:dei_champions/service/empower_women_service/empower_women_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class EmpowerWomenWorkForceController extends StateNotifier<EmpowerWomenWorkforceState> {
  final EmpowerWomenService _service = EmpowerWomenService();

  EmpowerWomenWorkForceController() : super(EmpowerWomenWorkforceState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getEmpowerWomenWorkForce();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => EmpowerWomenWorkForceModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getEmpowerWomenWorkForce  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
