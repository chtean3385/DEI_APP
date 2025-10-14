import 'package:dei_champions/constants/enums.dart';

import '../../job/job_model.dart';

class AppliedJobState {
  final PageState pageState;
  final List<JobModel>? data;
  final String? errorMessage;
  final String selectedFilter;

  AppliedJobState({required this.pageState, this.data, this.errorMessage,  this.selectedFilter="All",});

  factory AppliedJobState.initial() => AppliedJobState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "All",
  );

  AppliedJobState copyWith({
    PageState? pageState,
    List<JobModel>? data,
    String? errorMessage,
    String? selectedFilter,

  }) {
    return AppliedJobState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,

    );
  }
}
