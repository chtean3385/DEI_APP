import 'package:dei_champions/models/dash-board_all/dash_board_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/state_models/dash_board/dash_board_state.dart';
import '../../../../service/dash_board/dash_board_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class EmployerDashBoardController extends StateNotifier<DashBoardState> {
  final DashBoardService _service = DashBoardService();

  EmployerDashBoardController() : super(DashBoardState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getEmployerDashBoardData();
      final Data = (result.data as List)
          .map((e) => DashBoardModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch EmployerDashBoardController  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
