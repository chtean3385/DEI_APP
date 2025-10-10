import 'package:dei_champions/constants/enums.dart';
import '../../defense_veteran/dv_title_model.dart';

class VeteranTitleState {
  final PageState pageState;
  final List<VeteranTitleModel>? data;
  final String? errorMessage;

  VeteranTitleState({required this.pageState, this.data, this.errorMessage});

  factory VeteranTitleState.initial() => VeteranTitleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  VeteranTitleState copyWith({
    PageState? pageState,
    List<VeteranTitleModel>? data,
    String? errorMessage,
  }) {
    return VeteranTitleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
