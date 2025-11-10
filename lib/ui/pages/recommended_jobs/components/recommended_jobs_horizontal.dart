import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/recommended_jobs/components/recommended_job_horizontal_view.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/others/view_all_button.dart';

/// 📌 "Jobs based on your profile" section
class RecommendedJobsHorizontal extends StatelessWidget {
  const RecommendedJobsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ColoredBox(
      color: AppColors.bg,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Recommended jobs for you",
                    style: theme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  ViewAllButton(
                    isSmall: true,
                    onPressed: AppNavigator.loadRecommendedJobsScreen,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // horizontal list
            RecommendedJobHorizontalView(),
          ],
        ),
      ),
    );
  }
}
