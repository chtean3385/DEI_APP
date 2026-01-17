import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/lets_connect/lets_connect_model.dart';

class LetsConnectState {
  final PageState pageState;
  final PageState? submitPageState;
  final LetsConnectModel? data;
  final String? errorMessage;

  LetsConnectState({required this.pageState, this.data, this.errorMessage,this.submitPageState});

  factory LetsConnectState.initial() => LetsConnectState(
    pageState: PageState.initial,
    submitPageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  LetsConnectState copyWith({
    PageState? pageState,
    PageState? submitPageState,
    LetsConnectModel? data,
    String? errorMessage,
  }) {
    return LetsConnectState(
      pageState: pageState ?? this.pageState,
      submitPageState: submitPageState ?? this.submitPageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}
