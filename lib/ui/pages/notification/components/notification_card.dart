import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/notification/notification_model.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationCard({required this.notification, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = getNotificationColor(notification.type);
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
              Stack(
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
                          child: Text(getNotificationEmoji(notification.type))
                        ),
                      ),
                      const SizedBox(width: 8),
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
                  
                  
                  
                    
                  
                    ],
                  ),
                  Positioned(right: 0
                    ,child: (notification.isRead == false) ?
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: context.colors.buttonPrimaryColor.withValues(
                                alpha: 0.4)),
                      ),
                      child: Text(
                          "Mark read",
                          style: context.textTheme.displaySmall?.copyWith(
                              color: context.colors.buttonPrimaryColor,
                              fontSize: 11)
                      ),
                    ),
                  )
                      :
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withValues(alpha: 0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),)
                ],
              ),
              gapH4(),
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

Color getNotificationColor(String? type) {
  const colors = {
    // Job & Application
    'job_apply': Color(0xFF3B82F6),
    'job_status_update': Color(0xFFEC4899),

    // Interview
    'interview': Color(0xFFF59E0B),

    // Communication
    'inquiry_created': Color(0xFF0EA5E9),

    // Finance
    'invoice_sent': Color(0xFF22C55E),
    'estimate_sent': Color(0xFF14B8A6),

    // Fallback
    'default': Color(0xFF6B7280),
  };

  return colors[type] ?? colors['default']!;
}
String getNotificationEmoji(String? type) {
  const icons = {
    // Job & Application
    'job_apply': '📄',
    'job_status_update': '🔄',

    // Communication
    'inquiry_created': '📩',

    // Finance
    'invoice_sent': '🧾',
    'estimate_sent': '📑',

    // Fallback
    'default': '🔔',
  };

  return icons[type] ?? icons['default']!;
}
