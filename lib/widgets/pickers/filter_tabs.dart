import 'package:flutter/material.dart';
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';

class FilterTabs extends StatelessWidget {
  final List<String> tabs;
  final String? selected;
  final ValueChanged<String>? onSelected;

  const FilterTabs({
    super.key,
    required this.tabs,
    this.selected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          final isSelected = selected == tab;

          // Measure text width
          final textStyle = context.textTheme.bodyMedium?.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          );
          final textWidth = _calculateTextWidth(tab, textStyle);

          return GestureDetector(
            onTap: () => onSelected?.call(tab),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tab,
                    style: textStyle?.copyWith(
                      color: isSelected ? AppColors.primaryColor : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: textWidth,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  double _calculateTextWidth(String text, TextStyle? style) {
    if (style == null) return 50; // fallback width
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.size.width;
  }
}
