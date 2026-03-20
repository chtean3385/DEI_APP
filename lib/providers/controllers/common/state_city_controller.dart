import 'package:dei_champions/service/common/common_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../models/profile/edit_profile/json_item_model.dart';
import '../../../models/state_models/common/country_city_state.dart';


class StateCityController extends StateNotifier<CountryCityState> {
  final Ref _ref;
  final CommonService _service = CommonService();

  StateCityController(this._ref) : super(CountryCityState.initial()) {
    fetchStateCityData();
  }

  Future<void> fetchStateCityData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getStateCityData();
      final states = StateModel.listFromJson(result.data);
      debugPrint(" statesstatesstatesstates   -${states.length}");
      state = state.copyWith(pageState: PageState.success, states: states);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch fetchStateCityData  -${e.toString()}");
    }
  }
}
