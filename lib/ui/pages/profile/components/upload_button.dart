import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../widgets/others/custom_theme_button.dart';

class UploadButton extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onApply;

  const UploadButton({
    super.key,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: CustomThemeButton(
                child: Text(
                  "Cancel",
                  style: theme.labelMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                radius: 30,
                onTap: onClear,
                isExpanded: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomThemeButton(
                child: Text(
                  "Upload photo",
                  style: theme.labelMedium?.copyWith(color: Colors.white),
                ),
                radius: 30,
                onTap: onApply,
                isExpanded: true,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
