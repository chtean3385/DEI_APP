import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

/// 📈 Resume Boost card
class ResumeBoostCard extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final double? boostPercentage;
  final double? recruiterPercentage;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onButtonTap;

  const ResumeBoostCard({
    super.key,
    required this.title,
    this.boostPercentage,
    required this.buttonTitle,
    this.recruiterPercentage,
    required this.currentPage,
    required this.totalPages,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.zero,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: (BootstrapColors.colors["teal"] ?? AppColors.primaryColor),
                  size: 16,
                ),
                Text(
                  "Boost ${boostPercentage} %",
                  style: theme.labelSmall?.copyWith(
                    color: (BootstrapColors.colors["teal"] ?? AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            gapH8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,overflow: TextOverflow.ellipsis,softWrap: true,
                    style: theme.displaySmall,
                  ),
                ),
                width32(),
                CustomThemeButton(
                  radius: 30,
                  onTap: onButtonTap,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    buttonTitle,
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
