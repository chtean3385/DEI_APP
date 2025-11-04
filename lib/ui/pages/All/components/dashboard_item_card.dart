import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../models/dash-board_all/dash_board_model.dart';
import '../../../../utils/fa_icon.dart';

class DashboardItemModel {
  final String title;
  final String value;
  final int percentChange;
  final String image;
  final String routeId;

  DashboardItemModel(
    this.title,
    this.value,
    this.percentChange,
    this.image,
    this.routeId,
  );
}

class DashboardCard extends StatelessWidget {
  final DashBoardModel item;

  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final params = {'status': item.key};
        AppNavigator.routeMap[item.key]?.call(params);
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        surfaceTintColor: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 40,
                // adjust size as needed
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.2),
                      // subtle glow
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(getDashboardIcon(item.key), size: 24,color: AppColors.primaryColor,),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.count?.toString() ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      item.title ?? "",
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

class ShimmerDashboardCard extends StatelessWidget {
  const ShimmerDashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1,color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(radius: 20, backgroundColor: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShimmerBox(height: 14, width: 50),
                    SizedBox(height: 4),
                    ShimmerBox(height: 12, width: 150),
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
