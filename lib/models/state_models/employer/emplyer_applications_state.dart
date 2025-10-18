import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/employer/application_model.dart';


class EmployerApplicationState {
  final PageState pageState;
  final List<ApplicationModel>? data;
  final String? errorMessage;
  final String selectedFilter;

  EmployerApplicationState({required this.pageState, this.data, this.errorMessage,  this.selectedFilter="All",});

  factory EmployerApplicationState.initial() => EmployerApplicationState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "All",
  );

  EmployerApplicationState copyWith({
    PageState? pageState,
    List<ApplicationModel>? data,
    String? errorMessage,
    String? selectedFilter,

  }) {
    return EmployerApplicationState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,

    );
  }
}
