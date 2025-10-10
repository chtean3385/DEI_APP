import 'package:dei_champions/constants/enums.dart';
import '../../defense_veteran/dv_quote_model.dart';

class VeteranQuoteState {
  final PageState pageState;
  final List<VeteranQuoteModel>? data;
  final String? errorMessage;

  VeteranQuoteState({required this.pageState, this.data, this.errorMessage});

  factory VeteranQuoteState.initial() => VeteranQuoteState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  VeteranQuoteState copyWith({
    PageState? pageState,
    List<VeteranQuoteModel>? data,
    String? errorMessage,
  }) {
    return VeteranQuoteState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
