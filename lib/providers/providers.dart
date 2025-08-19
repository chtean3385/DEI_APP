// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import 'controllers/app_controller.dart';


final appProvider =
    AutoDisposeNotifierProvider<AppController, PageState>(
      () => AppController(),
    );


