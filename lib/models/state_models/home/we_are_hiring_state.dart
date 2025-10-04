import 'package:dei_champions/constants/enums.dart';
import '../../home/we_are_hiring/hiring_model.dart';


class WeAreHiringState {
  final PageState pageState;
  final List<HiringBannerModel>? data;
  final String? errorMessage;
  WeAreHiringState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory WeAreHiringState.initial() => WeAreHiringState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  WeAreHiringState copyWith({
    PageState? pageState,
    List<HiringBannerModel>? data,
    String? errorMessage,
  }) {
    return WeAreHiringState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
