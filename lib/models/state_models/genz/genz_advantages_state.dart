import 'package:dei_champions/constants/enums.dart';
import '../../gen-z/genz_advantages_model.dart';

class GenZAdvantagesState {
  final PageState pageState;
  final List<GenZAdvantageModel>? data;
  final String? errorMessage;

  GenZAdvantagesState({required this.pageState, this.data, this.errorMessage});

  factory GenZAdvantagesState.initial() => GenZAdvantagesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  GenZAdvantagesState copyWith({
    PageState? pageState,
    List<GenZAdvantageModel>? data,
    String? errorMessage,
  }) {
    return GenZAdvantagesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
