import '../../../constants/enums.dart';
import '../../job/job_model_api.dart';

class JobState {
  final String? errorMessage;
  final PageState pageState;
  final JobModelApi? data;
  /// track loading per job
  final Set<String> loadingJobIds;

  const JobState({this.errorMessage, this.pageState = PageState.initial,this.data, this.loadingJobIds = const {},});

  JobState copyWith({String? errorMessage, PageState? pageState, JobModelApi? data,Set<String>? loadingJobIds}) {
    return JobState(
      errorMessage: errorMessage ?? this.errorMessage,
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      loadingJobIds: loadingJobIds ?? this.loadingJobIds,
    );
  }

  factory JobState.initial() => JobState(
    pageState: PageState.initial,
    errorMessage: null,
    data: null,
  );
}
