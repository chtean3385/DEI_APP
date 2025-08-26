import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/others/custom_theme_button.dart';

void submitRegistration(BuildContext context) {
  // Show success dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white, // ✅ set white background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: AppColors.primaryColor, size: 30),
            SizedBox(width: 10),
            Text(
              'Success!',
              style: context.textTheme.headlineSmall // ensure text visible
            ),
          ],
        ),
        content: Text(
          'Registration completed successfully! Welcome to our job portal.',
          style: context.textTheme.bodySmall, // make content readable
        ),
        actions: [
          _nextButton(context),
        ],
      );
    },
  );
}
Widget _nextButton(BuildContext context) {
  return CustomThemeButton(
    color: AppColors.primaryColor,
    height: 56,
    radius: 16,
    isExpanded: false,
    onTap: () {
      Navigator.of(context).pop();
      // Navigate to dashboard or login
    },
    child: Text(
      'Continue',
      style: context.textTheme.titleMedium?.copyWith(
        color: context.theme.colorScheme.onPrimary,
      ),
    ),
  );
}
