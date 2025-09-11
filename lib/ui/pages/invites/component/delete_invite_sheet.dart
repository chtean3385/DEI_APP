import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../main.dart';
import '../../../../widgets/others/custom_theme_button.dart';

void showDeleteInviteConfirmationSheet(BuildContext context) {
  final theme = Theme.of(context).textTheme;
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delete NVite?",
                style: theme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Are you sure you want to delete this NVite? This action cannot be undone.",
                style: theme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),

              // 🔹 Right aligned Cancel & Delete buttons
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomThemeButton(
                          child: Text(
                            'Cancel',
                            style: theme.labelMedium?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          radius: 30,
                          onTap: () =>
                              Navigator.pop(navigatorKey.currentContext!),
                          isExpanded: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomThemeButton(
                          child: Text(
                            'Delete',
                            style: theme.labelMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          radius: 30,
                          onTap: () {},
                          isExpanded: true,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
