import 'package:dei_champions/models/ShineWithPride/lgbtq_quote_model.dart';
import 'package:dei_champions/service/lgbtq/lgbtq_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/lgbtq/lgbtq_quote_state.dart';

class LgbtqQuoteSection1Controller extends StateNotifier<LgbtqQuoteState> {
  final LgbtqService _service = LgbtqService();

  LgbtqQuoteSection1Controller() : super(LgbtqQuoteState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.lgbtqQuotes();
      final Data = (result["data"] as List)
          .map((e) => LgbtqQuoteModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch lgbtqQuotes  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
