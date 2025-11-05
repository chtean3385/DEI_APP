import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/common/faq_model.dart';


class FaqState {
  final PageState pageState;
  final List<FaqModel>? data;
  final String? errorMessage;
  FaqState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory FaqState.initial() => FaqState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  FaqState copyWith({
    PageState? pageState,
    List<FaqModel>? data,
    String? errorMessage,
  }) {
    return FaqState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
