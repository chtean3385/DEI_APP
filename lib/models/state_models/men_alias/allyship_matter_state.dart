import 'package:dei_champions/constants/enums.dart';

import '../../men_alias/allyship_matter_model.dart';

class AllyShipMatterState {
  final PageState pageState;
  final List<AllyshipMatterModel>? data;
  final String? errorMessage;

  AllyShipMatterState({required this.pageState, this.data, this.errorMessage});

  factory AllyShipMatterState.initial() => AllyShipMatterState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  AllyShipMatterState copyWith({
    PageState? pageState,
    List<AllyshipMatterModel>? data,
    String? errorMessage,
  }) {
    return AllyShipMatterState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
