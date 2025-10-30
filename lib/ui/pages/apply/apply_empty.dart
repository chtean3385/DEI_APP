import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_navigator.dart';

import 'package:flutter/material.dart';
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import '../../../constants/app_navigator.dart';

class AppliedJobCategoryEmptyView extends StatelessWidget {
  final String category;

  const AppliedJobCategoryEmptyView({super.key, required this.category});

  String get _title {
    switch (category) {
      case 'Pending':
        return "No pending applications";
      case 'Accepted':
        return "No accepted jobs yet";
      case 'Interviewing':
        return "No interviews scheduled";
      case 'Negotiation':
        return "No offers under negotiation";
      case 'Hired':
        return "You haven’t been hired yet";
      case 'Rejected':
        return "No rejected applications";
      default:
        return "You haven’t applied yet!";
    }
  }

  String get _subtitle {
    switch (category) {
      case 'Pending':
        return "Your applications awaiting employer review will appear here.";
      case 'Accepted':
        return "Jobs you’ve been shortlisted for will show up here.";
      case 'Interviewing':
        return "When an employer schedules an interview, you’ll see it here.";
      case 'Negotiation':
        return "Track offers and salary discussions here.";
      case 'Hired':
        return "Your successfully hired roles will appear here.";
      case 'Rejected':
        return "Rejected applications will be shown here.";
      default:
        return "Search for jobs and start applying. You can track your applications here!";
    }
  }

  String get _buttonText {
    return category == "All" ? "Start my job search" : "Explore jobs";
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
            Image.asset(
              AppDrawables.searchJob,
              height: 200,
            ),
            const SizedBox(height: 24),
            Text(
              _title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
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
              onTap: AppNavigator.loadJobSearchResultScreen,
            ),
          ],
        ),
      ),
    );
  }
}

