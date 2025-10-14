import 'package:dei_champions/constants/enums.dart';

import '../../job/job_model.dart';

class SavedJobState {
  final PageState pageState;
  final List<JobModel>? data;
  final String? errorMessage;
  final String selectedFilter;

  SavedJobState({required this.pageState, this.data, this.errorMessage,  this.selectedFilter="All",});

  factory SavedJobState.initial() => SavedJobState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "All",
  );

  SavedJobState copyWith({
    PageState? pageState,
    List<JobModel>? data,
    String? errorMessage,
    String? selectedFilter,

  }) {
    return SavedJobState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,

    );
  }
}
