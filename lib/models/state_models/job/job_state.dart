import '../../../constants/enums.dart';
import '../../job/job_model_api.dart';

class JobState {
  final String? errorMessage;
  final PageState pageState;
  final JobModelApi? data;

  const JobState({this.errorMessage, this.pageState = PageState.initial,this.data});

  JobState copyWith({String? errorMessage, PageState? pageState, JobModelApi? data}) {
    return JobState(
      errorMessage: errorMessage ?? this.errorMessage,
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
    );
  }

  factory JobState.initial() => JobState(
    pageState: PageState.initial,
    errorMessage: null,
    data: null,
  );
}
