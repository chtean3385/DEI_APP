import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';


class ManageJobsEmptyScreen extends StatelessWidget {
  const ManageJobsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration image
            Image.asset(
              AppDrawables.jobPost, // replace with your asset
              height: 200,
            ),

            const SizedBox(height: 24),

            // Title text
            Text(
              "You haven’t posted any jobs yet!",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle text
            Text(
              "Start attracting great talent by posting your first job today.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 32),

            // CTA button
            CustomThemeButton(
              child: const Text(
                "Post a Job",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: AppColors.primaryColor,
              radius: 30,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              onTap: (){},

            ),
          ],
        ),
      ),
    );
  }
}
