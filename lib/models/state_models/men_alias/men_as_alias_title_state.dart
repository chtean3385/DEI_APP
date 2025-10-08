import 'package:dei_champions/constants/enums.dart';

import '../../men_alias/men_as_alias_title_model.dart';

class MenAsAliasTitleState {
  final PageState pageState;
  final List<MenAsAlliesTitleModel>? data;
  final String? errorMessage;

  MenAsAliasTitleState({required this.pageState, this.data, this.errorMessage});

  factory MenAsAliasTitleState.initial() => MenAsAliasTitleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  MenAsAliasTitleState copyWith({
    PageState? pageState,
    List<MenAsAlliesTitleModel>? data,
    String? errorMessage,
  }) {
    return MenAsAliasTitleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
