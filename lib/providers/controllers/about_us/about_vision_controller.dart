import 'package:dei_champions/models/about_us/about_vision_model.dart';
import 'package:dei_champions/models/state_models/about_us/about_vision_state.dart';
import 'package:dei_champions/service/about_us/about_us_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class AboutVisionController extends StateNotifier<AboutVisionState> {
  final AboutUsService _aboutService = AboutUsService();

  AboutVisionController() : super(AboutVisionState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _aboutService.getAboutVisionMissionData();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => AboutVisionModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch about us vision mission fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
