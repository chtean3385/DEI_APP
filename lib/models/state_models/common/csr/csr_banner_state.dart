import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/common/csr/csr_banner_model.dart';

class CsrBannerState {
  final PageState pageState;
  final List<CsrBannerModel>? data;
  final String? errorMessage;

  CsrBannerState({required this.pageState, this.data, this.errorMessage});

  factory CsrBannerState.initial() => CsrBannerState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  CsrBannerState copyWith({
    PageState? pageState,
    List<CsrBannerModel>? data,
    String? errorMessage,
  }) {
    return CsrBannerState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
