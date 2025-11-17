import '../../constants/enums.dart';

class OtpState {
  final String? mobile;
  final String? userId;

  final PageState pageState;

  const OtpState({this.mobile,this.userId, this.pageState = PageState.initial});

  OtpState copyWith({String? email, PageState? pageState,String? userId}) {
    return OtpState(
      mobile: email ?? this.mobile,
      userId: userId ?? this.userId,

      pageState: pageState ?? this.pageState,
    );
  }
}
