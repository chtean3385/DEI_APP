import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../main.dart';

showSnackBar(
    final String? message, {
      int? duration,
      BuildContext? context,
      SnackBarAction? action,
      SnackBarBehavior behavior = SnackBarBehavior.fixed,
    }) {
  ScaffoldMessenger.of(context ?? navigatorKey.currentContext!)
      .showSnackBar(
    SnackBar(
      content: Text(
        message ?? '',
        style: const TextStyle(color: Colors.white), // text color
      ),
      duration: Duration(seconds: duration ?? 2),
      action: action,
      backgroundColor:AppColors.primaryColor, // yellow background
      behavior: SnackBarBehavior.fixed, // makes it float
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),   // round top-left
          topRight: Radius.circular(16),  // round top-right
          bottomLeft: Radius.zero,        // keep bottom square
          bottomRight: Radius.zero,       // keep bottom square
        ),
      ),
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
