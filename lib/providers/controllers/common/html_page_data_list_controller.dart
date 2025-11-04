import 'package:dei_champions/models/common/html_page_gata_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/state_models/html_page_data_state.dart';
import '../../../service/common/common_service.dart';
import '../../../widgets/others/snack_bar.dart';

class HtmlPageDataListController extends StateNotifier<HtmlPageDataListState> {
  HtmlPageDataListController() : super(HtmlPageDataListState.initial()) {
  }

  final CommonService _commonService = CommonService();

  Ref? ref;

  @override
  void dispose() {
    debugPrint("[HtmlPageDataListController] Disposing...");
    super.dispose();
  }

  Future<void> fetchHtmlPageData({required String pageName}) async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _commonService.getHtmlPageContent(pageName);
      final HtmlPagePageDataModel Data = HtmlPagePageDataModel.fromJson(result.data);
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      debugPrint(" catch fetchHtmlPagePageData   -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
