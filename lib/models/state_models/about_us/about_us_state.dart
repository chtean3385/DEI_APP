import 'package:dei_champions/constants/enums.dart';
import '../../about_us/about_us_model.dart';

class AboutUsState {
  final PageState pageState;
  final List<AboutUsModel>? data;
  final String? errorMessage;

  AboutUsState({required this.pageState, this.data, this.errorMessage});

  factory AboutUsState.initial() => AboutUsState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  AboutUsState copyWith({
    PageState? pageState,
    List<AboutUsModel>? data,
    String? errorMessage,
  }) {
    return AboutUsState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
