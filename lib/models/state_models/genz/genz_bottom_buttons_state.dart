import 'package:dei_champions/constants/enums.dart';
import '../../gen-z/genz_bottom_buttons_model.dart';

class GenZBottomButtonState {
  final PageState pageState;
  final List<GenZBottomButtonModel>? data;
  final String? errorMessage;

  GenZBottomButtonState({required this.pageState, this.data, this.errorMessage});

  factory GenZBottomButtonState.initial() => GenZBottomButtonState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  GenZBottomButtonState copyWith({
    PageState? pageState,
    List<GenZBottomButtonModel>? data,
    String? errorMessage,
  }) {
    return GenZBottomButtonState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
