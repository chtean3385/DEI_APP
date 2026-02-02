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
    final rawPercent = _fontSizeToRawPercent(fontSize);
    final percent = _snapToSteps(rawPercent);

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
            if (percent > 50)_FontActionButton(
              icon: Icons.remove,
              onTap: onDecrease,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                percent == 100 ? "100%" : "$percent%",
                style: context.textTheme.bodyMedium,
              ),
            ),
            if (percent < 200) _FontActionButton(
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
int _fontSizeToRawPercent(int fontSize) {
  const int minPx = 13;
  const int maxPx = 22;
  const int minPercent = 50;
  const int maxPercent = 200;

  return (((fontSize - minPx) *
      (maxPercent - minPercent) /
      (maxPx - minPx)) +
      minPercent)
      .round();
}
int _snapToSteps(int value) {
  const steps = [50, 75, 100, 125, 150, 175, 200];

  return steps.reduce(
        (a, b) => (value - a).abs() < (value - b).abs() ? a : b,
  );
}

