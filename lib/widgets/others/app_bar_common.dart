import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

AppBar appBarCommon({
  String? title,
  GestureTapCallback? onTapFn,
  double? elevation,
  Color? bgColor,
  Color? titleIconColor,
  bool arrowLeft = true,
  List<Widget>? actions,
  bool? titleStyleSmall

}) {
  final theme = Theme.of(navigatorKey.currentContext!);
  final themeColor = navigatorKey.currentContext!.colors;
  return AppBar(
    elevation: 0,
    backgroundColor:bgColor  ,
    leading:arrowLeft ?  BackButton(color:titleIconColor ??  themeColor.black54,) : null,
    title: title != null
        ? Text(title, style: titleStyleSmall == true ? theme.textTheme.bodySmall?.copyWith(color: titleIconColor)  : theme.textTheme.headlineSmall?.copyWith(color: titleIconColor))
        : null,
    actions: actions,
  );
}
