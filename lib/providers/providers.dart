// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../models/state_models/auth_state.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth_controller.dart';


final appProvider =
    AutoDisposeNotifierProvider<AppController, PageState>(
      () => AppController(),
    );


/// authentication controller
final authProvider =
AutoDisposeNotifierProvider<AuthController, AuthState>(AuthController.new);
