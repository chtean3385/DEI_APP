import 'package:dei_champions/constants/enums.dart';
import '../../ShineWithPride/lgbtq_title_detiail_model.dart';

class LgbtqTitleState {
  final PageState pageState;
  final List<LgbtqTitleModel>? data;
  final String? errorMessage;

  LgbtqTitleState({required this.pageState, this.data, this.errorMessage});

  factory LgbtqTitleState.initial() => LgbtqTitleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  LgbtqTitleState copyWith({
    PageState? pageState,
    List<LgbtqTitleModel>? data,
    String? errorMessage,
  }) {
    return LgbtqTitleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
