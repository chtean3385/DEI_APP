import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String option;
  final bool showRemove;
  final bool isSelected;
  final bool isMulti;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onRemove;

  const CustomChip({
    super.key,
    required this.option,
    this.showRemove = true,
    this.isMulti = false,
    required this.onChanged,
    this.onRemove, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    return GestureDetector(
      onTap:()=>onChanged(option),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:colorTheme.buttonPrimaryColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: isSelected ? 2 : 0.2,
            color: isSelected
                ? const Color(0xFF4285F4)
                : Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                option,
                style: context.textTheme.displaySmall?.copyWith(
                  color: colorTheme.themBasedBlack,
                  fontWeight: isSelected
                      ? FontWeight.w500
                      : FontWeight.normal,
                ),
              ),
              if (showRemove) const SizedBox(width: 4),
              if (showRemove)
                GestureDetector(
                  onTap: () {
                    print("showRemoveshowRemove - $option");
                    isMulti?onChanged(option)  :   onChanged("");
                  },
                  child:  Icon(Icons.close, size: 18, color: colorTheme.themBasedBlack),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
