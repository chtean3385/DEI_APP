import 'package:dei_champions/constants/enums.dart';
import '../../ShineWithPride/inclusion_points_model.dart';

class LgbtqInclusionPointState {
  final PageState pageState;
  final List<InclusionPointsModel>? data;
  final String? errorMessage;

  LgbtqInclusionPointState({required this.pageState, this.data, this.errorMessage});

  factory LgbtqInclusionPointState.initial() => LgbtqInclusionPointState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  LgbtqInclusionPointState copyWith({
    PageState? pageState,
    List<InclusionPointsModel>? data,
    String? errorMessage,
  }) {
    return LgbtqInclusionPointState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
