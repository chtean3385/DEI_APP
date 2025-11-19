import '../../../../constants/enums.dart';
import '../../home/promo_banner/promo_banner_model.dart';

class PromoBannerState {
  final PageState pageState;
  final PromoBannerModel? data;
  final String? errorMessage;

  PromoBannerState({
    this.pageState = PageState.initial,
    this.data,
    this.errorMessage,
  });

  PromoBannerState copyWith({
    PageState? pageState,
    PromoBannerModel? data,
    String? errorMessage,
  }) {
    return PromoBannerState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  factory PromoBannerState.initial() => PromoBannerState();
}
