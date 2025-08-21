import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_navigator.dart';
import '../../constants/enums.dart';
import '../../models/state_models/auth_state.dart';

class AuthController extends AutoDisposeNotifier<AuthState> {
  // final mobileNumberController = TextEditingController();
  // final userNameController = TextEditingController();
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();

  // final AuthService _authService = AuthService();
  String? error;

  @override
  AuthState build() {
    ref.onDispose(() {
      // userNameController.dispose();
      // mobileNumberController.dispose();
      // emailNameController.dispose();
      // passwordController.dispose();
    });

    return AuthState();
  }

  void setPageState(PageState newState) {
    state = state.copyWith(pageState: newState);
  }

  void initController() {
    setPageState(PageState.initial);
    // mobileNumberController.clear();
    // userNameController.clear();
    emailNameController.clear();
    passwordController.clear();
  }

  // Future<void> verifyOtp({required String phone}) async {
  //   setPageState(PageState.loading);
  //   try {
  //     final BaseModel result = await _authService.verifyOtp(
  //       phone: phone,
  //       otp: int.tryParse(state.otp) ?? 0,
  //     );
  //     showSnackBar(result.message, duration: 3);
  //     final ChefModel chefModel = ChefModel.fromAuthJson(result.data);
  //     loadMainScreen(chefModel: chefModel);
  //     setPageState(PageState.success);
  //   } catch (e) {
  //     setPageState(PageState.error);
  //     showSnackBar(e.toString());
  //     debugPrint("catch - verifyOtp");
  //     debugPrint(e.toString());
  //   }
  // }
  //
  //
  // ///Resend OTP ///
  // Future<void> resendOtp({required String phone}) async {
  //   setPageState(PageState.loading);
  //   try {
  //     final BaseModel result = await _authService.resendOtp(
  //       phoneNumber: phone,
  //     );
  //     showSnackBar(result.message, duration: 3);
  //     setPageState(PageState.success);
  //   } catch (e) {
  //     setPageState(PageState.error);
  //     showSnackBar(e.toString());
  //     debugPrint("catch - resendOtp");
  //     debugPrint(e.toString());
  //   }
  // }

  void setOtp(String val) {
    state = state.copyWith(isOtpValid: val.length == 6, otp: val);
  }

  void updateIsOtpValid(bool val) {
    if (state.isOtpValid != val) {
      debugPrint("isOtpValid Updated to: $val");
      state = state.copyWith(isOtpValid: val);
    }
  }

  ///Sign In ///
  Future<void> signInUser(BuildContext context) async {
    setPageState(PageState.loading);
    await Future.delayed(Duration(seconds: 3));
    AppNavigator.loadOtpScreen();
    setPageState(PageState.success);
    // try {
    //   final BaseModel result = await _authService.signIn(
    //     phoneNumber: mobileNumberController.text.trim(),
    //   );
    //   showOverlaySnackBar(context, result.message);
    //   loadOtpScreen();
    //   setPageState(PageState.success);
    // } catch (e) {
    //   setPageState(PageState.error);
    //   showOverlaySnackBar(context, e.toString());
    //   debugPrint("catch - signInUser");
    //   debugPrint(e.toString());
    // }
  }

  // void logoutAlertBox() {
  //   WidgetUtils.showLogoutPopUp(
  //     navigatorKey.currentContext!,
  //     sBtnFunction: () => signOut(),
  //   );
  // }

  // Future<void> signOut() async {
  //   await SharedPreferenceRepository.setToken("");
  //   await SharedPreferenceRepository.setUserId("");
  //   loadSignInScreen(isFromLogout: true);
  // }

  // Future<void> loadMainScreen({ChefModel? chefModel}) async {
  //   await SharedPreferenceRepository.setToken(chefModel!.token ?? "");
  //   await SharedPreferenceRepository.setUserId(chefModel.id.toString());
  //   ref.read(homeChefProvider.notifier).setChefData(chefModel);
  //   loadBottomBar();
  // }

  // void loadBottomBar() {
  //   Navigator.pushAndRemoveUntil(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => BottomBar()),
  //     (route) => false,
  //   );
  // }



  // void loadSignInScreen({bool isFromLogout = false}) {
  //  if(!isFromLogout) initController();
  //   Navigator.pushAndRemoveUntil(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (_) => SignInScreen()),
  //     (route) => false,
  //   );
  // }

  // void loadOtpScreen() {
  //   Navigator.push(
  //     navigatorKey.currentContext!,
  //     MaterialPageRoute(
  //       builder: (_) => OTPScreen(phone: mobileNumberController.text.trim()),
  //     ),
  //   );
  // }
}
