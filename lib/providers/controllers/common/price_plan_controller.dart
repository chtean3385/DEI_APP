import 'package:dei_champions/models/state_models/common/price_plan_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/common/price_plan_model.dart';
import '../../../service/common/common_service.dart';

class PricePlanController extends StateNotifier<PricePlanState> {
  final CommonService _service = CommonService();

  PricePlanController() : super(PricePlanState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getPlanPriceData();

      print("✅ Raw API Data: ${result.data}");

      // ✅ Extract list of plans from result.data
      final List<dynamic>? list = result.data as List<dynamic>?;

      // ✅ Safely parse each item
      final List<PricingPlanModel> data = list != null
          ? list.map((e) => PricingPlanModel.fromJson(e as Map<String, dynamic>)).toList()
          : [];

      print("✅ Parsed Pricing Plans: ${data.length}");

      state = state.copyWith(pageState: PageState.success, data: data);
    } catch (e, st) {
      debugPrint("❌ catch PricePlanController fetchData - $e");
      debugPrintStack(stackTrace: st);
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      showSnackBar(e.toString());
    }
  }

}
