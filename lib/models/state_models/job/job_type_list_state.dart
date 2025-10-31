import 'package:dei_champions/constants/enums.dart';
import '../../job/job_type_model.dart';

class JobTypeListState {
  final PageState pageState;
  final List<JobTypeModel>? data;

  JobTypeListState({required this.pageState, this.data});

  factory JobTypeListState.initial() =>
      JobTypeListState(pageState: PageState.initial, data: null);

  JobTypeListState copyWith({PageState? pageState, List<JobTypeModel>? data}) {
    return JobTypeListState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
    );
  }
}
