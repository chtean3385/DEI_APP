import 'package:dei_champions/constants/enums.dart';
import '../../common/price_plan_model.dart';



class PricePlanState {
  final PageState pageState;
  final List<PricingPlanModel>? data;
  final String? errorMessage;
  PricePlanState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory PricePlanState.initial() => PricePlanState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  PricePlanState copyWith({
    PageState? pageState,
    List<PricingPlanModel>? data,
    String? errorMessage,
  }) {
    return PricePlanState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
