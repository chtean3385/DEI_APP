import 'package:dei_champions/constants/enums.dart';
import '../../../common/csr/csr_focus_area_model.dart';

class CsrFocusAreaState {
  final PageState pageState;
  final List<FocusAreaModel>? data;
  final String? errorMessage;

  CsrFocusAreaState({required this.pageState, this.data, this.errorMessage});

  factory CsrFocusAreaState.initial() => CsrFocusAreaState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  CsrFocusAreaState copyWith({
    PageState? pageState,
    List<FocusAreaModel>? data,
    String? errorMessage,
  }) {
    return CsrFocusAreaState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
