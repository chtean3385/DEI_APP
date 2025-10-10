import 'package:dei_champions/models/defense_veteran/dv_quote_model.dart';
import 'package:dei_champions/service/veteran/veteran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/defense_veteran/dv_organizationa_benefit_model.dart';
import '../../../models/state_models/veteran/veteran_organizational_benefit_state.dart';
import '../../../models/state_models/veteran/veteran_quote_state.dart';

class VeteranOrganizationalBenefitSectionController extends StateNotifier<VeteranOrganizationalBenefitState> {
  final VeteranService _service = VeteranService();

  VeteranOrganizationalBenefitSectionController() : super(VeteranOrganizationalBenefitState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.veteranOrganizationalBenefits();
      final Data = (result["data"] as List)
          .map((e) => DvOrganizationalBenefitModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
      );
      debugPrint(" catch veteranOrganizationalBenefits  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
