import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/home/how_it_works/how_it_works_response_model.dart';


class HowItWorkState {
  final PageState pageState;
  final List<HowItWorksResponse>? data;
  final String? errorMessage;
  HowItWorkState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory HowItWorkState.initial() => HowItWorkState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  HowItWorkState copyWith({
    PageState? pageState,
    List<HowItWorksResponse>? data,
    String? errorMessage,
  }) {
    return HowItWorkState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
