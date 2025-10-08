import 'package:dei_champions/models/empower_women/women_quote_model.dart';
import 'package:dei_champions/models/state_models/empower_women/empower_women_quote_state.dart';
import 'package:dei_champions/service/empower_women_service/empower_women_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class EmpowerWomenQuoteController extends StateNotifier<EmpowerWomenQuoteState> {
  final EmpowerWomenService _service = EmpowerWomenService();

  EmpowerWomenQuoteController() : super(EmpowerWomenQuoteState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getEmpowerWomenImpact();

      final Data = (result as List)
          .map((e) => WomenQuoteModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getEmpowerWomenImpact  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
