import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/disability/disability_inclusion_steps_model.dart';

class DisabilityInclusionStepsState {
  final PageState pageState;
  final List<DisabilityInclusionStepsModel>? data;
  final String? errorMessage;

  DisabilityInclusionStepsState({required this.pageState, this.data, this.errorMessage});

  factory DisabilityInclusionStepsState.initial() => DisabilityInclusionStepsState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  DisabilityInclusionStepsState copyWith({
    PageState? pageState,
    List<DisabilityInclusionStepsModel>? data,
    String? errorMessage,
  }) {
    return DisabilityInclusionStepsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
