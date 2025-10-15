import 'package:dei_champions/constants/enums.dart';
import '../on_board/on_board_model.dart';

class OnBoardingState {
  final PageState pageState;
  final List<OnBoardModel>? data;
  final String? errorMessage;

  OnBoardingState({required this.pageState, this.data, this.errorMessage});

  factory OnBoardingState.initial() => OnBoardingState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  OnBoardingState copyWith({
    PageState? pageState,
    List<OnBoardModel>? data,
    String? errorMessage,
  }) {
    return OnBoardingState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
