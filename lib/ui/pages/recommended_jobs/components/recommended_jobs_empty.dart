import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_navigator.dart';

class RecommendedJobsEmptyView extends StatelessWidget {
  final bool isProfileIncomplete;

  const RecommendedJobsEmptyView({
    super.key,
    required this.isProfileIncomplete,
  });

  String get _title {
    return "No job recommendations yet";
  }

  String get _subtitle {
    if (isProfileIncomplete) {
      return "Complete your profile to help us match you with better job recommendations.";
    } else {
      return "Keep your profile updated to receive more accurate job recommendations.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppDrawables.searchJob, height: 200),
            const SizedBox(height: 24),

            /// Title
            Text(
              _title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            /// Subtitle
            Text(
              _subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 32),

            /// Button
            CustomThemeButton(
              child: const Text(
                "Start Job Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: AppColors.primaryColor,
              radius: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onTap: AppNavigator.loadJobSearchResultScreen,
            ),

            const SizedBox(height: 12),

            /// Optional "Complete Profile" button when profile incomplete
            if (isProfileIncomplete)
              CustomThemeButton(
                child: const Text(
                  "Complete My Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                color: AppColors.primaryColor,
                radius: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: AppNavigator.loadEditProfileScreen,
              ),
          ],
        ),
      ),
    );
  }
}
