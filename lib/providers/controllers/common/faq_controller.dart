import 'package:dei_champions/models/common/faq_model.dart';
import 'package:dei_champions/models/state_models/common/faq_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../constants/app_strings.dart';
import '../../../service/common/common_service.dart';

class FaqController extends StateNotifier<FaqState> {
  final CommonService _service = CommonService();

  FaqController() : super(FaqState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getFaqData();
      final Data = (result.data as List)
          .map((e) => FaqModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch FaqController fetchData -${e.toString()}");
      showSnackBar(AppStrings.somethingWentWrong);
    }
  }
}
