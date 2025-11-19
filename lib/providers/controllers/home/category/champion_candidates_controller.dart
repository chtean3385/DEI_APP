import 'package:dei_champions/models/home/dei_champion_candidates/champion_list_model.dart';
import 'package:dei_champions/models/state_models/home/champion_candidates_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class ChampionCandidatesController extends StateNotifier<ChampionCandidatesState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  ChampionCandidatesController(this._ref) : super(ChampionCandidatesState.initial()) {
    fetchData();
  }
  @override
  void dispose() {
    debugPrint("🔥 ChampionCandidatesController disposed");
    super.dispose();
  }
  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getChampionCandidates();
      final Data = (result as List)
          .map((e) => CandidateListModel.fromJson(e))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
