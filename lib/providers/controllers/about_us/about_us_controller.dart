import 'package:dei_champions/models/about_us/about_us_model.dart';
import 'package:dei_champions/service/about_us/about_us_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/about_us/about_us_state.dart';

class AboutUsController extends StateNotifier<AboutUsState> {
  final AboutUsService _aboutService = AboutUsService();

  AboutUsController() : super(AboutUsState.initial()) {
    fetchData();
  }
  @override
  void dispose() {
    debugPrint("🔥 AboutUsController disposed");
    super.dispose();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _aboutService.getAboutUsData();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => AboutUsModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch about us  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
