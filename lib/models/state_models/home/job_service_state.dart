import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/home/job_services/job_service_model.dart';

import '../../home/featured_employer/employer_model.dart';
import '../../home/friendly_industries/friendly_industry_model.dart';

class JobServiceState {
  final PageState pageState;
  final List<JobServiceModel>? data;
  final String? errorMessage;

  JobServiceState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });

  factory JobServiceState.initial() => JobServiceState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  JobServiceState copyWith({
    PageState? pageState,
    List<JobServiceModel>? data,
    String? errorMessage,
  }) {
    return JobServiceState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
