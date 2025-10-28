import '../../../constants/enums.dart';

class JobState {
  final String? errorMessage;
  final PageState pageState;

  const JobState({this.errorMessage, this.pageState = PageState.initial});

  JobState copyWith({String? errorMessage, PageState? pageState}) {
    return JobState(
      errorMessage: errorMessage ?? this.errorMessage,
      pageState: pageState ?? this.pageState,
    );
  }

  factory JobState.initial() => JobState(
    pageState: PageState.initial,
    errorMessage: null,
  );
}
