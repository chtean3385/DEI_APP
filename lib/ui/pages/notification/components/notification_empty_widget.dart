import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class EmptyNotificationWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onAction;
  final String? actionText;

  const EmptyNotificationWidget({
    super.key,
    this.title,
    this.subtitle,
    this.onAction,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;

    return Center(
      child: Padding(
        padding: AppStyles.commonResponsivePaddingWithBottomOffset(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: colorTheme.black45,
            ),
            const SizedBox(height: 16),
            Text(
              title ?? "No notifications yet",
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorTheme.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle ?? "You're all caught up.\n New notifications will appear here.",
              textAlign: TextAlign.center,
              maxLines: 3,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),
            if (onAction != null) ...[
              const SizedBox(height: 20),
              TextButton(
                onPressed: onAction,
                child: Text(
                  actionText ?? "Refresh",
                  style: TextStyle(color: colorTheme.buttonPrimaryColor),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
