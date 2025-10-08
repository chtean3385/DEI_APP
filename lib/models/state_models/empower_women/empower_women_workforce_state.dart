import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/empower_women/empower_women_workforce_model.dart';

class EmpowerWomenWorkforceState {
  final PageState pageState;
  final List<EmpowerWomenWorkForceModel>? data;
  final String? errorMessage;

  EmpowerWomenWorkforceState({required this.pageState, this.data, this.errorMessage});

  factory EmpowerWomenWorkforceState.initial() => EmpowerWomenWorkforceState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  EmpowerWomenWorkforceState copyWith({
    PageState? pageState,
    List<EmpowerWomenWorkForceModel>? data,
    String? errorMessage,
  }) {
    return EmpowerWomenWorkforceState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
