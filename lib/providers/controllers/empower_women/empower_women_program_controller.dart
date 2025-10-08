import 'package:dei_champions/models/empower_women/empower_women_program_model.dart';
import 'package:dei_champions/models/state_models/empower_women/empower_women_program_state.dart';
import 'package:dei_champions/service/empower_women_service/empower_women_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class EmpowerWomenProgramController extends StateNotifier<EmpowerWomenProgramState> {
  final EmpowerWomenService _service = EmpowerWomenService();

  EmpowerWomenProgramController() : super(EmpowerWomenProgramState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getEmpowerWomenHero();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => WomenProgramModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getEmpowerWomenHero  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
