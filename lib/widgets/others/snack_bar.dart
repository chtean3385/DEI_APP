import 'package:flutter/material.dart';

import '../../main.dart';

showSnackBar(
  final String? message, {
  int? duration,
  BuildContext? context,
  SnackBarAction? action,
  SnackBarBehavior behavior = SnackBarBehavior.fixed,
}) {
  ScaffoldMessenger.of(context ?? navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message ?? ''),
      duration: Duration(seconds: duration ?? 1),
      action: action,
      behavior: behavior,
    ),
  );
}

void showOverlaySnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  final theme = Theme.of(context);
  final snackBarTheme = theme.snackBarTheme;

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 0, // adjust as needed
      left: 0,
      right: 0,
      child: Material(
        elevation: snackBarTheme.elevation ?? 6,
        color:const Color(0xFFe0e4e6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            message
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 3), () => overlayEntry.remove());
}
