import '../../constants/enums.dart';

class OtpState {
  final String? mobile;
  final String? userId;

  final PageState pageState;
  final PageState resendPageState;

  const OtpState({this.mobile,this.userId, this.pageState = PageState.initial,this.resendPageState = PageState.initial});

  OtpState copyWith({String? email, PageState? pageState,PageState? resendPageState,String? userId}) {
    return OtpState(
      mobile: email ?? this.mobile,
      userId: userId ?? this.userId,

      pageState: pageState ?? this.pageState,
      resendPageState: resendPageState ?? this.resendPageState,
    );
  }
}
