import 'package:dei_champions/models/common/base_model.dart';
import 'package:dei_champions/models/state_models/home/popup_alert_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/home/promo_banner/home_popup_model.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class PopupAlertController extends StateNotifier<PopupAlertState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  PopupAlertController(this._ref) : super(PopupAlertState.initial()) {
  }

  @override
  void dispose() {
    debugPrint("🔥 PopupAlertController disposed");
    super.dispose();
  }

  Future<void> fetchPopupData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _jobCategoryService.getHomePopupContent();
      final popupData = HomePopupModel.fromJson(result.data);
      state = state.copyWith(pageState: PageState.success, data: popupData);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchPopupData -${e.toString()}");
    }
  }
}
