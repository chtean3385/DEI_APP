import 'package:dei_champions/constants/enums.dart';
import '../../about_us/what_we_do_model.dart';
import '../../home/dei_champion_candidates/champion_list_model.dart';

class WhatWeDoState {
  final PageState pageState;
  final List<WhatWeDoModel>? data;
  final String? errorMessage;

  WhatWeDoState({required this.pageState, this.data, this.errorMessage});

  factory WhatWeDoState.initial() => WhatWeDoState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  WhatWeDoState copyWith({
    PageState? pageState,
    List<WhatWeDoModel>? data,
    String? errorMessage,
  }) {
    return WhatWeDoState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
