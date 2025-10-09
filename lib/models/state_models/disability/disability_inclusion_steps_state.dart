import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/disability/disability_inclusion_steps_model.dart';

class DisabilityInclusionStepsState {
  final PageState pageState;
  final List<DisabilityInclusionStepsModel>? data;
  final String? errorMessage;
  final String selectedFilter; // 'left' or 'right'

  DisabilityInclusionStepsState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.selectedFilter = 'left',
  });

  factory DisabilityInclusionStepsState.initial() =>
      DisabilityInclusionStepsState(
        pageState: PageState.initial,
        data: null,
        errorMessage: null,
        selectedFilter: 'left',
      );

  DisabilityInclusionStepsState copyWith({
    PageState? pageState,
    List<DisabilityInclusionStepsModel>? data,
    String? errorMessage,
    String? selectedFilter,
  }) {
    return DisabilityInclusionStepsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
