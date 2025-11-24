import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class EmptyDashboardWidget extends StatelessWidget {
  const EmptyDashboardWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
final colorTheme = context.colors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isDark?AppDrawables.searchJobDark :  AppDrawables.searchJob,
              height: 200,
            ),
            const SizedBox(height: 24),
            Text(
              "No job stats available yet!",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Start exploring and applying for jobs to see your statistics here.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),
            const SizedBox(height: 32),
            CustomThemeButton(
              child: const Text(
                "Find Jobs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: colorTheme.buttonPrimaryColor,
              radius: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onTap: AppNavigator.loadJobSearchResultScreen,
            ),
          ],
        ),
      ),
    );
  }
}
