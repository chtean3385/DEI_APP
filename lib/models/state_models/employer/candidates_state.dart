import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/employer/candidate_model.dart';


class CandidatesState {
  final PageState pageState;
  final List<CandidateModel>? data;
  final String? errorMessage;
  final String selectedFilter;

  CandidatesState({required this.pageState, this.data, this.errorMessage,  this.selectedFilter="All",});

  factory CandidatesState.initial() => CandidatesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "Title",
  );

  CandidatesState copyWith({
    PageState? pageState,
    List<CandidateModel>? data,
    String? errorMessage,
    String? selectedFilter,

  }) {
    return CandidatesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,

    );
  }
}
