import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../models/auth/auth_model.dart';
import '../../../../../widgets/others/custom_theme_button.dart';

void submitRegistration(BuildContext context,{AuthModel? authModel}) {
  // Show success dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        // ✅ set white background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: AppColors.primaryColor, size: 30),
            SizedBox(width: 10),
            Text(
              'Success!',
              style: context.textTheme.headlineSmall, // ensure text visible
            ),
          ],
        ),
        content: Text(
          'Registration completed successfully! Welcome to our job portal.',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 13,
          ), // make content readable
        ),
        actions: [_nextButton(context,authModel: authModel)],
      );
    },
  );
}

Widget _nextButton(BuildContext context,{AuthModel? authModel}) {
  return CustomThemeButton(
    color: AppColors.primaryColor,
    height: 30,
    radius: 12,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    isExpanded: false,
    alignRight: true,
    onTap: () {
      Navigator.of(context).pop();
      AppNavigator.saveAuthDataAndLoadBottomBar(authModel: authModel);
      // Navigate to dashboard or login
    },
    child: Text(
      'Continue',
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    ),
  );
}
