import 'package:dei_champions/constants/enums.dart';
import '../../ShineWithPride/lgbtq_advantages_model.dart';

class LgbtqAdvantagesState {
  final PageState pageState;
  final List<LgbtqAdvantageModel>? data;
  final String? errorMessage;

  LgbtqAdvantagesState({required this.pageState, this.data, this.errorMessage});

  factory LgbtqAdvantagesState.initial() => LgbtqAdvantagesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  LgbtqAdvantagesState copyWith({
    PageState? pageState,
    List<LgbtqAdvantageModel>? data,
    String? errorMessage,
  }) {
    return LgbtqAdvantagesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
