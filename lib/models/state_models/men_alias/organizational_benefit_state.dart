import 'package:dei_champions/constants/enums.dart';

import '../../men_alias/organizational_benefit_model.dart';

class OrganizationalBenefitState {
  final PageState pageState;
  final List<OrganizationalBenefitModel>? data;
  final String? errorMessage;

  OrganizationalBenefitState({required this.pageState, this.data, this.errorMessage});

  factory OrganizationalBenefitState.initial() => OrganizationalBenefitState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  OrganizationalBenefitState copyWith({
    PageState? pageState,
    List<OrganizationalBenefitModel>? data,
    String? errorMessage,
  }) {
    return OrganizationalBenefitState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
