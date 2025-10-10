import 'package:dei_champions/constants/enums.dart';
import '../../defense_veteran/dv_organizationa_benefit_model.dart';

class VeteranOrganizationalBenefitState {
  final PageState pageState;
  final List<DvOrganizationalBenefitModel>? data;
  final String? errorMessage;

  VeteranOrganizationalBenefitState({required this.pageState, this.data, this.errorMessage});

  factory VeteranOrganizationalBenefitState.initial() => VeteranOrganizationalBenefitState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  VeteranOrganizationalBenefitState copyWith({
    PageState? pageState,
    List<DvOrganizationalBenefitModel>? data,
    String? errorMessage,
  }) {
    return VeteranOrganizationalBenefitState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
