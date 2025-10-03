import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isSmall;
  final bool fillColor;
  final double radius;

  const ViewAllButton({
    super.key,
    this.onPressed,
    this.text = "View all",
    this.isSmall = false,
    this.fillColor = false,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final textStyle = isSmall
        ? theme.displaySmall?.copyWith(
      color: fillColor ? Colors.white : AppColors.primaryColor,
      fontWeight: FontWeight.w600,
    )
        : theme.bodySmall?.copyWith(
      color: fillColor ? Colors.white : AppColors.primaryColor,
      fontWeight: FontWeight.w600,
    );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: fillColor ? AppColors.primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
