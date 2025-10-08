import 'package:dei_champions/models/state_models/men_alias/men_as_alias_title_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/men_alias/men_as_alias_title_model.dart';
import '../../../service/man_alias_service/men_service.dart';

class MenAsAliasTitleController extends StateNotifier<MenAsAliasTitleState> {
  final MenService _service = MenService();

  MenAsAliasTitleController() : super(MenAsAliasTitleState.initial()) {
    fetchData();
  }
  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getHeroManAsAlies();
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => MenAsAlliesTitleModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getHeroManAsAlies fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
