import 'package:dei_champions/constants/enums.dart';
import '../../job/salary_range_model.dart';

class SalaryRangeListState {
  final PageState pageState;
  final List<SalaryRangeModel>? data;

  SalaryRangeListState({required this.pageState, this.data});

  factory SalaryRangeListState.initial() =>
      SalaryRangeListState(pageState: PageState.initial, data: null);

  SalaryRangeListState copyWith({PageState? pageState, List<SalaryRangeModel>? data}) {
    return SalaryRangeListState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
    );
  }
}
