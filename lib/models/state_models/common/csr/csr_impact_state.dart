import 'package:dei_champions/constants/enums.dart';
import '../../../common/csr/csr_impact_model.dart';

class CsrImpactState {
  final PageState pageState;
  final List<CsrImpactModel>? data;
  final String? errorMessage;

  CsrImpactState({required this.pageState, this.data, this.errorMessage});

  factory CsrImpactState.initial() => CsrImpactState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  CsrImpactState copyWith({
    PageState? pageState,
    List<CsrImpactModel>? data,
    String? errorMessage,
  }) {
    return CsrImpactState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
