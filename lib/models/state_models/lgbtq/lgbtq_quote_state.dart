import 'package:dei_champions/constants/enums.dart';
import '../../ShineWithPride/lgbtq_quote_model.dart';

class LgbtqQuoteState {
  final PageState pageState;
  final List<LgbtqQuoteModel>? data;
  final String? errorMessage;

  LgbtqQuoteState({required this.pageState, this.data, this.errorMessage});

  factory LgbtqQuoteState.initial() => LgbtqQuoteState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  LgbtqQuoteState copyWith({
    PageState? pageState,
    List<LgbtqQuoteModel>? data,
    String? errorMessage,
  }) {
    return LgbtqQuoteState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
