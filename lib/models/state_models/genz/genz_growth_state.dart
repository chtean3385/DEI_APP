import 'package:dei_champions/constants/enums.dart';
import '../../gen-z/genz_growth_model.dart';

class GenZGrowthState {
  final PageState pageState;
  final List<GenZGrowthModel>? data;
  final String? errorMessage;

  GenZGrowthState({required this.pageState, this.data, this.errorMessage});

  factory GenZGrowthState.initial() => GenZGrowthState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  GenZGrowthState copyWith({
    PageState? pageState,
    List<GenZGrowthModel>? data,
    String? errorMessage,
  }) {
    return GenZGrowthState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
