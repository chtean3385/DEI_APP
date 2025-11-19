import 'package:dei_champions/models/common/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/explore_career/explore_service_program_model.dart';
import '../../../models/men_alias/organizational_benefit_model.dart';
import '../../../models/state_models/men_alias/organizational_benefit_state.dart';
import '../../../models/state_models/services/services_state.dart';
import '../../../service/home/explore_our_service.dart';
import '../../../service/man_alias_service/men_service.dart';

class CareerExploreServicesController extends StateNotifier<CareerExploreServicesState> {
  final CareerExploreServices _service = CareerExploreServices();

  CareerExploreServicesController() : super(CareerExploreServicesState.initial()) {
    fetchData();
  }
  @override
  void dispose() {
    debugPrint("🔥 CareerExploreServicesController disposed");
    super.dispose();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _service.getOurServices();

      // ✅ Extract "cards" array correctly
      final dataList = (result.data as List);
      final cards = dataList.isNotEmpty ? dataList.first['cards'] as List<dynamic> : [];

      print("Cards count: ${cards.length}");

      final data = cards
          .map((e) => ExploreServiceProgramModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data ?? []);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch CareerExploreServicesController fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
