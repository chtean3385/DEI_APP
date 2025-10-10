import 'package:dei_champions/models/defense_veteran/dv_quote_model.dart';
import 'package:dei_champions/service/veteran/veteran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/veteran/veteran_quote_state.dart';

class VeteranQuoteSectionController extends StateNotifier<VeteranQuoteState> {
  final VeteranService _service = VeteranService();

  VeteranQuoteSectionController() : super(VeteranQuoteState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.veteranQuotes();
      final Data = (result["data"] as List)
          .map((e) => VeteranQuoteModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch veteranQuotes  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
