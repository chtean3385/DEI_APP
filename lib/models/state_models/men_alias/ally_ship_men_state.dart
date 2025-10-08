import 'package:dei_champions/constants/enums.dart';
import '../../men_alias/ally_ship_men_model.dart';

class AllyShipMenState {
  final PageState pageState;
  final List<AllyShipMenModel>? data;
  final String? errorMessage;

  AllyShipMenState({required this.pageState, this.data, this.errorMessage});

  factory AllyShipMenState.initial() => AllyShipMenState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  AllyShipMenState copyWith({
    PageState? pageState,
    List<AllyShipMenModel>? data,
    String? errorMessage,
  }) {
    return AllyShipMenState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
