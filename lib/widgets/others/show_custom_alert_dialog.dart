import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'custom_theme_button.dart';

Future<void> showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String primaryButtonText,
  required VoidCallback onPrimaryPressed,
  required String secondaryButtonText,
  required VoidCallback onSecondaryPressed,
}) async {
  final theme = Theme.of(context).textTheme;
  final colorTheme = context.colors;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: colorTheme.commonDividerBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Warning Icon
            Icon(Icons.error_outline, color: Colors.orange[300], size: 60),

            const SizedBox(height: 16),

            // Title
            Text(title, textAlign: TextAlign.center, style: theme.titleMedium),

            const SizedBox(height: 12),

            // Message
            Text(message, textAlign: TextAlign.center, style: theme.bodyMedium),

            const SizedBox(height: 28),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Primary Button
                CustomThemeButton(
                  child: Text(
                    primaryButtonText,
                    style: theme.labelMedium?.copyWith(color: colorTheme.themBasedWhite),
                  ),
                  radius: 30,

                  onTap: onPrimaryPressed,
                  isExpanded: false,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: colorTheme.buttonPrimaryColor,
                ),

                const SizedBox(width: 16),
                CustomThemeButton(
                  child: Text(
                    secondaryButtonText,
                    style: theme.labelMedium?.copyWith(color: colorTheme.themBasedBlack),
                  ),
                  radius: 30,

                  onTap: onSecondaryPressed,
                  isExpanded: false,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: colorTheme.cardBgColor,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
