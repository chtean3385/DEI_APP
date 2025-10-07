import 'package:dei_champions/models/about_us/core_values_model.dart';
import 'package:dei_champions/models/state_models/about_us/core_value_state.dart';
import 'package:dei_champions/service/about_us/about_us_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class CoreValueController extends StateNotifier<CoreValueState> {
  final AboutUsService _aboutService = AboutUsService();

  CoreValueController() : super(CoreValueState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _aboutService.getCoreValueData();
      final Data = (result as List)
          .map((e) => CoreValuesModel.fromJson(e))
          .toList();
      print("CoreValuesModel ---  ${Data.first.title}");
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch about us core value fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
