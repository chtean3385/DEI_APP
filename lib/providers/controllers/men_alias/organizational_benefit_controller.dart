import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/men_alias/organizational_benefit_model.dart';
import '../../../models/state_models/men_alias/organizational_benefit_state.dart';
import '../../../service/man_alias_service/men_service.dart';

class OrganizationalBenefitController extends StateNotifier<OrganizationalBenefitState> {
  final MenService _service = MenService();

  OrganizationalBenefitController() : super(OrganizationalBenefitState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getOrganizationalBenefits();
      // ✅ Correct extraction
      final list = result['data'] as List<dynamic>?;
      final data = list
          ?.map((e) => OrganizationalBenefitModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch getOrganizationalBenefits fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
