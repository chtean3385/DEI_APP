import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/disability/disability_title_details_model.dart';

class DisabilityTitleState {
  final PageState pageState;
  final List<DisabilityTitleDetailsModel>? data;
  final String? errorMessage;

  DisabilityTitleState({required this.pageState, this.data, this.errorMessage});

  factory DisabilityTitleState.initial() => DisabilityTitleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  DisabilityTitleState copyWith({
    PageState? pageState,
    List<DisabilityTitleDetailsModel>? data,
    String? errorMessage,
  }) {
    return DisabilityTitleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
