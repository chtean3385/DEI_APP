import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';




double measureChipWidth(BuildContext context, String text) {
  final style = navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  final textSpan = TextSpan(text: text, style: style);
  final tp = TextPainter(
    text: textSpan,
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();

  return tp.width + 20; // padding: 10 left + 10 right
}
