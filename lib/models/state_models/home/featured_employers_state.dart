import 'package:dei_champions/constants/enums.dart';

import '../../home/featured_employer/employer_model.dart';

class FeaturedEmployersState {
  final PageState pageState;
  final List<Employer>? data;
  final String? errorMessage;

  FeaturedEmployersState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });

  factory FeaturedEmployersState.initial() => FeaturedEmployersState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  FeaturedEmployersState copyWith({
    PageState? pageState,
    List<Employer>? data,
    String? errorMessage,
  }) {
    return FeaturedEmployersState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
