import 'package:dei_champions/constants/enums.dart';
import '../../defense_veteran/dv_advantages_model.dart';

class VeteranAdvantageState {
  final PageState pageState;
  final List<VeteranAdvantageModel>? data;
  final String? errorMessage;

  VeteranAdvantageState({required this.pageState, this.data, this.errorMessage});

  factory VeteranAdvantageState.initial() => VeteranAdvantageState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  VeteranAdvantageState copyWith({
    PageState? pageState,
    List<VeteranAdvantageModel>? data,
    String? errorMessage,
  }) {
    return VeteranAdvantageState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
