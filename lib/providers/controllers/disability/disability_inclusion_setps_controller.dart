import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/disability/disability_inclusion_steps_model.dart';
import 'package:dei_champions/models/state_models/disability/disability_inclusion_steps_state.dart';
import 'package:dei_champions/service/not_defined_by_disability/disability_service.dart';
import 'package:dei_champions/widgets/others/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisabilityInclusionStepsController
    extends StateNotifier<DisabilityInclusionStepsState> {
  final DisabilityService _service = DisabilityService();

  DisabilityInclusionStepsController()
    : super(DisabilityInclusionStepsState.initial()) {
    fetchData();
  }

  /// Fetches API data
  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getDisabilityInclusionSteps();
      final data = (result as List)
          .map((e) => DisabilityInclusionStepsModel.fromJson(e))
          .toList();

      // Set initial data and default filter = 'left'
      state = state.copyWith(
        pageState: PageState.success,
        data: data,
        selectedFilter: 'left',
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(
        "catch getDisabilityInclusionSteps fetchData - ${e.toString()}",
      );
      showSnackBar(e.toString());
    }
  }

  /// Change selected filter (left/right)
  void changeFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  /// Return filtered list based on current selection
  List<RowContentModel> getFilteredList() {
    final data = state.data;
    if (data == null || data.isEmpty) return [];

    final rows = data.first.rows ?? [];
    if (state.selectedFilter == 'left') {
      return rows.map((e) => e.left).whereType<RowContentModel>().toList();
    } else {
      return rows.map((e) => e.right).whereType<RowContentModel>().toList();
    }
  }
}
