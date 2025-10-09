import 'package:dei_champions/constants/enums.dart';
import '../../gen-z/gen_z_title_model.dart';

class GenZTitleState {
  final PageState pageState;
  final List<GenZTitleModel>? data;
  final String? errorMessage;

  GenZTitleState({required this.pageState, this.data, this.errorMessage});

  factory GenZTitleState.initial() => GenZTitleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  GenZTitleState copyWith({
    PageState? pageState,
    List<GenZTitleModel>? data,
    String? errorMessage,
  }) {
    return GenZTitleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
