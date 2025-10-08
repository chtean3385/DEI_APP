import 'package:dei_champions/models/men_alias/champion_diversity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/state_models/men_alias/champion_diversity_state.dart';
import '../../../service/man_alias_service/men_service.dart';

class MenChampionDiversityController extends StateNotifier<ChampionDiversityState> {
  final MenService _service = MenService();

  MenChampionDiversityController() : super(ChampionDiversityState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getChampionDiversityMan();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => ChampionDiversityModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getChampionDiversityMan  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
