import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class EditProfileActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const EditProfileActionButtons({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Cancel Button
            CustomThemeButton(
              onTap: onCancel,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Cancel',
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),
              radius: 30,
              color: Colors.white,
              borderColor: AppColors.primaryColor,
            ),

            const SizedBox(width: 16),

            // Save Button
            CustomThemeButton(
              onTap: onSave,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outline_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Save',
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              radius: 30,
              color: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
