import 'dart:async';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/enums.dart';
import '../../repo/shared_preference_repository.dart';


class AppController extends AutoDisposeNotifier<PageState> {
  late final Ref _ref;

  @override
  PageState build() {
    _ref = ref;
    return PageState.initial;
  }

  Future<void> fetchAppDetails() async {
    await checkUserToken() ;
  }

  Future<void> checkUserToken() async {
    state = PageState.loading;
    await Future.delayed(const Duration(seconds: 3));
    // final token = await SharedPreferenceRepository.getToken();
    final token = "qqwqw"; // use this to simulate unauthenticated
    state = PageState.success;
    if (token.isNotEmpty == true) {
      AppNavigator.toBottomBar();
    } else {
      AppNavigator.loadSignInScreen();
    }
  }



}
