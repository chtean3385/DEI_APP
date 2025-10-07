import 'package:dei_champions/models/about_us/what_we_do_model.dart';
import 'package:dei_champions/models/state_models/about_us/what_we_do_state.dart';
import 'package:dei_champions/service/about_us/about_us_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class WhatWeDoController extends StateNotifier<WhatWeDoState> {
  final AboutUsService _aboutService = AboutUsService();

  WhatWeDoController() : super(WhatWeDoState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _aboutService.getWhatWeDoData();

      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;

      final data = list
          ?.map((e) => WhatWeDoModel.fromJson(e as Map<String, dynamic>))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch wat we do fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
