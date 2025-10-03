import '../../../../constants/enums.dart';
import '../../home/job_category/job_category_group.dart';

class JobCategoryState {
  final PageState pageState;
  final JobCategoryGroup? data;
  final String? errorMessage;

  JobCategoryState({
    this.pageState = PageState.initial,
    this.data,
    this.errorMessage,
  });

  JobCategoryState copyWith({
    PageState? pageState,
    JobCategoryGroup? data,
    String? errorMessage,
  }) {
    return JobCategoryState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  factory JobCategoryState.initial() => JobCategoryState();
}
