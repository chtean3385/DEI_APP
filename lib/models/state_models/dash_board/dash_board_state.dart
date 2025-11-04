import 'package:dei_champions/constants/enums.dart';

import '../../dash-board_all/dash_board_model.dart';

class DashBoardState {
  final PageState pageState;
  final List<DashBoardModel>? data;
  final String? errorMessage;
  final String selectedFilter;

  DashBoardState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.selectedFilter = "All",
  });

  factory DashBoardState.initial() => DashBoardState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "All",
  );

  DashBoardState copyWith({
    PageState? pageState,
    List<DashBoardModel>? data,
    String? errorMessage,
    String? selectedFilter,
  }) {
    return DashBoardState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
