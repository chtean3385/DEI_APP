import 'package:dei_champions/models/common/csr/csr_objective_model.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_objectives_state.dart';
import 'package:dei_champions/service/common/csr_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class CsrObjectivesSectionController extends StateNotifier<CsrObjectivesState> {
  final CsrService _service = CsrService();

  CsrObjectivesSectionController() : super(CsrObjectivesState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getObjectivesData();
      final Data = (result.data as List)
          .map((e) => CsrObjectiveModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      debugPrint(
        " catch CsrObjectivesSectionController  fetchData -${e.toString()}",
      );
      showSnackBar(e.toString());
    }
  }
}
