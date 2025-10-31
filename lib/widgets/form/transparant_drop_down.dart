import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class TransparentDropdownField extends StatelessWidget {
  final String hint;
  final String? label;
  final IconData icon;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final double? radius;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;

  const TransparentDropdownField({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
    required this.onChanged,
    this.value,
    this.label,
    this.radius,
    this.fillColor,
    this.validator,
  });
  // Helper: Capitalize first letter for display
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
// Normalize current value (case-insensitive)
    final normalizedValue = items.firstWhere(
          (e) => e.toLowerCase() == value?.toLowerCase(),
      orElse: () => '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
        if (label != null) gapH4(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor ?? AppColors.primaryColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(radius ?? 16),
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.13),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              value: value,
              validator: validator,
              isExpanded: true,
              dropdownColor: AppColors.primaryColor, // dropdown list bg
              borderRadius: BorderRadius.circular(radius ?? 16),

              // The text style for the selected value
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black, // black when selected
                fontWeight: FontWeight.bold,
              ),

              decoration: InputDecoration(
                prefixIcon: Icon(icon, color: Colors.black54, size: 22),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 14,
                ),
              ),

              hint: Text(
                hint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),

              // White dropdown menu items
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    _capitalize(item),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white, // white inside dropdown list
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
                  .toList(),

              // Selected item builder: black text in field
              selectedItemBuilder: (BuildContext context) {
                return items.map((item) {
                  return Text(
                    _capitalize(item),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black, // black only for selected value
                      fontWeight: FontWeight.normal,
                    ),
                  );
                }).toList();
              },

              onChanged: (val) => onChanged(val?.toLowerCase()),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
