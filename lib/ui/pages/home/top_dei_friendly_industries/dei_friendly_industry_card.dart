import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/home/friendly_industries/friendly_industry_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';

class DeiFriendlyIndustryCard extends StatelessWidget {
  final FriendlyIndustry employer;
  final VoidCallback? onTap;

  const DeiFriendlyIndustryCard({required this.employer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: SizedBox(
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(employer.icon, width: 50, height: 50),
                gapH4(),
                Text(
                  employer.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                gapH4(),
                Text(
                  employer.jobs,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.displaySmall?.copyWith(
                    fontSize: 9,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerDeiFriendlyIndustryCard extends StatelessWidget {
  const ShimmerDeiFriendlyIndustryCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: SizedBox(
        width: 130,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 50, width: 50),
              ),
              gapH4(),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 100),
              ),
              SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 50),
              ),
              gapH4(),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 8, width: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getBootStrapColor(String? colorKey) {
  return BootstrapColors.colors[colorKey] ?? Colors.grey;
}
