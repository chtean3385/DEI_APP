import 'package:dei_champions/constants/enums.dart';
import '../../../common/csr/csr_objective_model.dart';

class CsrObjectivesState {
  final PageState pageState;
  final List<CsrObjectiveModel>? data;
  final String? errorMessage;

  CsrObjectivesState({required this.pageState, this.data, this.errorMessage});

  factory CsrObjectivesState.initial() => CsrObjectivesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  CsrObjectivesState copyWith({
    PageState? pageState,
    List<CsrObjectiveModel>? data,
    String? errorMessage,
  }) {
    return CsrObjectivesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
