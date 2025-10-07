import 'package:dei_champions/constants/enums.dart';
import '../../about_us/revelution_model.dart';

class RevolutionState {
  final PageState pageState;
  final List<DeiRevolutionModel>? data;
  final String? errorMessage;

  RevolutionState({required this.pageState, this.data, this.errorMessage});

  factory RevolutionState.initial() => RevolutionState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  RevolutionState copyWith({
    PageState? pageState,
    List<DeiRevolutionModel>? data,
    String? errorMessage,
  }) {
    return RevolutionState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
