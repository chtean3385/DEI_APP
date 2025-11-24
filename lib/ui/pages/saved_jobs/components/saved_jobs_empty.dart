import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_navigator.dart';


class SavedJobsEmptyScreen extends StatelessWidget {
  const SavedJobsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration image
            Image.asset(
              isDark?AppDrawables.searchJobDark : AppDrawables.searchJob, // replace with your asset
              height: 200,
            ),

            const SizedBox(height: 24),

            // Title text
            Text(
              "You haven’t saved yet!",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle text
            Text(
              "Start exploring and save jobs you like. You can view all your saved jobs here!",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),

            const SizedBox(height: 32),

            // CTA button
            CustomThemeButton(
              child:  Text(
                "Start my job search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: colorTheme.buttonPrimaryColor,
              radius: 30,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              onTap: AppNavigator.loadJobSearchResultScreen,

            ),
          ],
        ),
      ),
    );
  }
}
