import 'package:dei_champions/models/men_alias/ally_ship_men_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/men_alias/ally_ship_men_state.dart';
import '../../../service/man_alias_service/men_service.dart';

class AllyShipMenController extends StateNotifier<AllyShipMenState> {
  final MenService _service = MenService();

  AllyShipMenController() : super(AllyShipMenState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getAllyShipMan();
      final Data = (result as List)
          .map((e) => AllyShipMenModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getAllyShipMan  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
