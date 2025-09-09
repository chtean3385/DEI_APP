import 'package:flutter/material.dart';

import '../main.dart';

class AppStyles {
  static final commonResponsivePadding20 = EdgeInsets.symmetric(horizontal:MediaQuery.of(navigatorKey.currentContext!).size.shortestSide * 0.1 ,vertical: 20);
  static final mediumResponsivePadding = EdgeInsets.symmetric(horizontal:MediaQuery.of(navigatorKey.currentContext!).size.width * 0.3 ,vertical: 20);
  static final standardLoginPadding = EdgeInsets.all(20);


}

Widget gap() => const SizedBox(height: 10);
Widget gapW6() => const SizedBox(width: 6);
Widget gapW8() => const SizedBox(width: 8);
Widget gapH4() => const SizedBox(height: 4);
Widget gapH8() => const SizedBox(height: 8);
Widget gap16() => const SizedBox(height: 16);
Widget gapH20() => const SizedBox(height: 20);
Widget gapH32() => const SizedBox(height: 32);
Widget gap100() => const SizedBox(height: 100);
Widget width32() => const SizedBox(width: 32);