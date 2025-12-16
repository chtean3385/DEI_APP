import '../../../../constants/enums.dart';
import '../../home/promo_banner/home_popup_model.dart';

class PopupAlertState {
  final PageState pageState;
  final HomePopupModel? data;
  final String? errorMessage;

  PopupAlertState({
    this.pageState = PageState.initial,
    this.data,
    this.errorMessage,
  });

  PopupAlertState copyWith({
    PageState? pageState,
    HomePopupModel? data,
    String? errorMessage,
  }) {
    return PopupAlertState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  factory PopupAlertState.initial() => PopupAlertState();
}
