import 'package:dei_champions/constants/enums.dart';

import '../../home/featured_employer/employer_model.dart';
import '../../home/friendly_industries/friendly_industry_model.dart';

class FriendlyIndustryState {
  final PageState pageState;
  final List<FriendlyIndustry>? data;
  final String? errorMessage;
  final String selectedFilter;

  FriendlyIndustryState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.selectedFilter="All",
  });

  factory FriendlyIndustryState.initial() => FriendlyIndustryState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    selectedFilter: "All",
  );

  FriendlyIndustryState copyWith({
    PageState? pageState,
    List<FriendlyIndustry>? data,
    String? errorMessage,
    String? selectedFilter,
  }) {
    return FriendlyIndustryState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
