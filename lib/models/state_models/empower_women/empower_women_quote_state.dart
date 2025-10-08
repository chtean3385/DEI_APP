import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/empower_women/women_quote_model.dart';

class EmpowerWomenQuoteState {
  final PageState pageState;
  final List<WomenQuoteModel>? data;
  final String? errorMessage;

  EmpowerWomenQuoteState({required this.pageState, this.data, this.errorMessage});

  factory EmpowerWomenQuoteState.initial() => EmpowerWomenQuoteState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  EmpowerWomenQuoteState copyWith({
    PageState? pageState,
    List<WomenQuoteModel>? data,
    String? errorMessage,
  }) {
    return EmpowerWomenQuoteState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
