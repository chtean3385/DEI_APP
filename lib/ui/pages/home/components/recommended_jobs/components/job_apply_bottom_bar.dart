import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../widgets/others/custom_theme_button.dart';

class ApplyJobBottomBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onClear;
  final VoidCallback onApply;

  const ApplyJobBottomBar({
    super.key,
    required this.selectedCount,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    if (selectedCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomThemeButton(
              child: Text(
                "Clear selection",
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
                "Apply to all ($selectedCount)",
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
    );
  }
}
