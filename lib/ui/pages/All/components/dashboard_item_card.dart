import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardItemModel {
  final String title;
  final String value;
  final int percentChange;
  final String image;
  final String routeId;

  DashboardItemModel(this.title, this.value, this.percentChange, this.image,this.routeId);
}

class DashboardCard extends StatelessWidget {
  final DashboardItemModel item;

  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isPositive = item.percentChange >= 0;
    final percentColor = isPositive ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () {
        AppNavigator.routeMap[item.routeId]?.call();
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        surfaceTintColor: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          child: Row(
            children: [
            Container(
            width: 40, // adjust size as needed
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // background color
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.2), // subtle glow
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            ),child: Center(child: SvgPicture.asset(item.image, height: 24, width: 24))),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.value,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        gapW16(),
                        Icon(isPositive ? Icons.trending_up :Icons.trending_down , color: percentColor, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "${item.percentChange.abs()}%",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: percentColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      item.title,
                      style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
