import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

class EmployerManageJobsEmptyScreen extends StatelessWidget {
  final String category;

  const EmployerManageJobsEmptyScreen({super.key, required this.category});

  String get _title {
    switch (category.toLowerCase()) {
      case 'open':
        return "No open jobs yet";
      case 'closed':
        return "No closed jobs";
      case 'draft':
        return "No draft jobs";
      case 'totalJobs':
      case 'all':
        return "You haven’t posted any jobs yet!";
      default:
        return "No jobs found";
    }
  }

  String get _subtitle {
    switch (category.toLowerCase()) {
      case 'open':
        return "Jobs currently active and accepting applications will appear here.";
      case 'closed':
        return "Jobs you’ve closed will show up here.";
      case 'draft':
        return "Jobs you started creating but haven’t published yet will appear here.";
      case 'totalJobs':
      case 'all':
        return "Start attracting great talent by posting your first job today.";
      default:
        return "There are no jobs under this category right now.";
    }
  }

  String get _buttonText {
    switch (category.toLowerCase()) {
      case 'draft':
        return "Create Draft Job";
      default:
        return "Post a Job";
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
            Image.asset(AppDrawables.jobPost, height: 200),
            const SizedBox(height: 24),
            Text(
              _title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            CustomThemeButton(
              child: Text(
                _buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: AppColors.primaryColor,
              radius: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onTap: () => AppNavigator.toBottomBar(initialPage: 1),
            ),
          ],
        ),
      ),
    );
  }
}
