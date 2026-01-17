import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SettingFontSize extends StatelessWidget {
  final int fontSize;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const SettingFontSize({
    super.key,
    required this.fontSize,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = context.colors;

    return Card(
      elevation: 2,
      color: themeColor.jobCardBgColor,
      shadowColor: themeColor.buttonPrimaryColor,
      surfaceTintColor: themeColor.buttonPrimaryColor,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          Icons.format_size,
          color: themeColor.buttonPrimaryColor,
          size: 25,
        ),
        title: Text(
          "Font Size",
          style: context.textTheme.labelMedium?.copyWith(height: 2),
        ),
        subtitle: Text(
          "Adjust text size across the app",
          style: context.textTheme.bodyMedium?.copyWith(
            color: themeColor.black54,
            height: 1,
            fontSize: 13,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FontActionButton(
              icon: Icons.remove,
              onTap: onDecrease,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                fontSize.toString(),
                style: context.textTheme.bodyMedium,
              ),
            ),
            _FontActionButton(
              icon: Icons.add,
              onTap: onIncrease,
            ),
          ],
        ),
      ),
    );
  }
}
class _FontActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _FontActionButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = context.colors;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          size: 22,
          color: themeColor.buttonPrimaryColor,
        ),
      ),
    );
  }
}
