import 'package:dei_champions/models/dash-board_all/dash_board_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/dash_board/dash_board_state.dart';
import '../../../service/dash_board/dash_board_service.dart';

class DashBoardController extends StateNotifier<DashBoardState> {
  final DashBoardService _service = DashBoardService();

  DashBoardController() : super(DashBoardState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getDashBoardData();
      final Data = (result.data as List)
          .map((e) => DashBoardModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch DashBoardController  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
