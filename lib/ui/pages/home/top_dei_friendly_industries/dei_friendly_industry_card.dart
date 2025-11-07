import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/home/friendly_industries/friendly_industry_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../main.dart';

class DeiFriendlyIndustryCard extends StatelessWidget {
  final IndustryDepartmentModel department;
  final VoidCallback? onTap;

  const DeiFriendlyIndustryCard({required this.department, this.onTap});

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
          width: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.bg,
                  radius: 14,
                  child: Text(
                    (department.name?.isNotEmpty ?? false)
                        ? department.name![0].toUpperCase()
                        : "",
                    style: theme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                gapH4(),
                Text(
                  department.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.labelMedium,
                  textAlign: TextAlign.center,
                ),

                gapH4(),
                gapH4(),
                chipTile(department.trend ?? "",true),
                gapH4(),
                chipTile("Focus: ${department.focus ?? ""}",false),
                gapH4(),
                gapH4(),
                Text(
                 " ${department.openJobs?.toString() ?? ""} Open jobs",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.labelMedium?.copyWith(
                    fontSize: 10,
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
  Widget chipTile(String tag,bool small) {
    return // Tag chip
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: small? (BootstrapColors.colors["blueCapsule"] ?? AppColors.bg) :(BootstrapColors.colors["purpleCapsule"] ?? AppColors.bg) ,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tag,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          textAlign: TextAlign.center,
          style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize:small ? 8 :  10,
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
