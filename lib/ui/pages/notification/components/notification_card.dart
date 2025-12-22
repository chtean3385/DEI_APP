import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/notification/notification_model.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../utils/fa_icon.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationCard({required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: AppColors.primaryColor,
      surfaceTintColor: notification.isRead == true
          ? Colors.white
          : AppColors.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    // adjust size as needed
                    height: 30,
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
                      child: Icon(
                        Icons.notifications,
                        size: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title ?? "",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        gapH4(),

                        Text(
                          notification.description ?? "",
                          style: context.textTheme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  (notification.isRead == false)
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        )
                      : SizedBox(width: 12, height: 12),
                ],
              ),
              gapH4(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 12,
                    color: Colors.black54,
                  ),
                  gapW6(),
                  Text(
                    getTimeAgo(notification.createdAt ?? DateTime.now()),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.displaySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerNotificationCard extends StatelessWidget {
  const ShimmerNotificationCard();

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: 30, width: 30, radius: 15),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(height: 14, width: 200),
                        gapH4(),
                        ShimmerBox(height: 10, width: double.infinity),
                        gapH4(),
                        ShimmerBox(height: 10, width: double.infinity),
                      ],
                    ),
                  ),
                ],
              ),
              gapH4(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerBox(height: 12, width: 12),
                  gapW6(),
                  ShimmerBox(height: 10, width: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
