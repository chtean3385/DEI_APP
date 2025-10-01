import '../../constants/enums.dart';

class OtpState {
  final String? email;

  final PageState pageState;

  const OtpState({this.email, this.pageState = PageState.initial});

  OtpState copyWith({String? email, PageState? pageState}) {
    return OtpState(
      email: email ?? this.email,

      pageState: pageState ?? this.pageState,
    );
  }
}
