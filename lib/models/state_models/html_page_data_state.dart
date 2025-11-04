import 'package:dei_champions/constants/enums.dart';
import '../common/html_page_gata_model.dart';
import '../on_board/on_board_model.dart';

class HtmlPageDataListState {
  final PageState? pageState;
  final HtmlPagePageDataModel? data;
  final String? errorMessage;

  HtmlPageDataListState({ this.pageState, this.data, this.errorMessage});

  factory HtmlPageDataListState.initial() => HtmlPageDataListState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  HtmlPageDataListState copyWith({
    PageState? pageState,
    HtmlPagePageDataModel? data,
    String? errorMessage,
  }) {
    return HtmlPageDataListState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
