
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/providers/controllers/auth/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/state_models/otp_state.dart';
import '../../../repo/shared_preference_repository.dart';
import '../../../service/auth_service.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../providers.dart';

class LogoutController extends StateNotifier<OtpState> {
  final Ref ref;

  LogoutController(this.ref) : super(const OtpState());

  final AuthService _authService = AuthService();
  String? error;
  void logoutAlertBox(BuildContext context) {
    WidgetUtils.showLogoutPopUp(
      context,
      sBtnFunction: () => signOut(),
    );
  }

  Future<void> signOut() async {
    await deleteFcm();
    await SharedPreferenceRepository.setToken("");
    // await SharedPreferenceRepository.setUserId("");
    await SharedPreferenceRepository.setRoleId(0);

    ref.read(drawerProfileProvider.notifier).clearState();
    ref.read(profileCompletionProvider.notifier).clearState();
    AppNavigator.loadSignInScreen();

  }

  Future<void> forceLogout({String? message}) async {
    await SharedPreferenceRepository.setToken("");
    // await SharedPreferenceRepository.setUserId("");
    await SharedPreferenceRepository.setRoleId(0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppNavigator.loadSignInScreen();
      if (message != null) {
        showSnackBar(message, duration: 3);
      }
    });
    await Future.delayed(Duration(seconds: 1));
  }

  deleteFcm() async {
    try {
      String userId = await SharedPreferenceRepository.getUserId();
      String deviceType = await getDeviceType();
      await _authService.saveFcmToken(fcm:  "",userId: userId, deviceType: deviceType);
      debugPrint("✅ Saved Fcm ");
    } catch (e) {
      debugPrint("deleteFcm Fcm  error --->> ${e.toString()} ");
      showSnackBar(e.toString());
    }
  }
}
