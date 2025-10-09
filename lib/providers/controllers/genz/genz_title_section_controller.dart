import 'package:dei_champions/models/gen-z/gen_z_title_model.dart';
import 'package:dei_champions/service/gen-z/genz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/genz/genz_title_state.dart';

class GenZTitleSectionController extends StateNotifier<GenZTitleState> {
  final GenZService _service = GenZService();

  GenZTitleSectionController() : super(GenZTitleState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.genZTitleDetails();
      final Data = (result as List)
          .map((e) => GenZTitleModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch genZTitleDetails  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
