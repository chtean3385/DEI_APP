import 'package:dei_champions/models/about_us/revelution_model.dart';
import 'package:dei_champions/service/about_us/about_us_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/about_us/revolution_state.dart';

class AboutUsRevolutionController extends StateNotifier<RevolutionState> {
  final AboutUsService _aboutService = AboutUsService();

  AboutUsRevolutionController() : super(RevolutionState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _aboutService.getRevolutionData();
      // ✅ Correct extraction
      final Data = (result as List)
          .map((e) => DeiRevolutionModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch about us revolution fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
