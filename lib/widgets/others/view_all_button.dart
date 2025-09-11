import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isSmall;

  const ViewAllButton({
    super.key,
     this.onPressed,
    this.text = "View all",
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0), // avoid extra padding
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: isSmall ?  theme.displaySmall?.copyWith(
            color: AppColors.primaryColor,fontWeight: FontWeight.w600
        ) : theme.bodySmall?.copyWith(
          color: AppColors.primaryColor,fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
