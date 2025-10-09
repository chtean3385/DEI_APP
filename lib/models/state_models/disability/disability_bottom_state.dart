import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/disability/disability_bottom_details_model.dart';

class DisabilityBottomState {
  final PageState pageState;
  final List<DisabilityBottomDetailModel>? data;
  final String? errorMessage;

  DisabilityBottomState({required this.pageState, this.data, this.errorMessage});

  factory DisabilityBottomState.initial() => DisabilityBottomState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  DisabilityBottomState copyWith({
    PageState? pageState,
    List<DisabilityBottomDetailModel>? data,
    String? errorMessage,
  }) {
    return DisabilityBottomState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
