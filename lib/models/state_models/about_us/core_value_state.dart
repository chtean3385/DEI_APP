import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/about_us/core_values_model.dart';

class CoreValueState {
  final PageState pageState;
  final List<CoreValuesModel>? data;
  final String? errorMessage;

  CoreValueState({required this.pageState, this.data, this.errorMessage});

  factory CoreValueState.initial() => CoreValueState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  CoreValueState copyWith({
    PageState? pageState,
    List<CoreValuesModel>? data,
    String? errorMessage,
  }) {
    return CoreValueState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
