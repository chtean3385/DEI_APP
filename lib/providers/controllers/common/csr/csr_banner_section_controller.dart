import 'package:dei_champions/models/common/csr/csr_banner_model.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_banner_state.dart';
import 'package:dei_champions/service/common/csr_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class CsrBannerSectionController extends StateNotifier<CsrBannerState> {
  final CsrService _service = CsrService();

  CsrBannerSectionController() : super(CsrBannerState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getCsrBannerData();
      final Data = (result.data as List)
          .map((e) => CsrBannerModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch CsrBannerSectionController  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
