import 'package:dei_champions/constants/app_theme.dart';
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
  final bool isRequired;
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
    this.isRequired = false,
  });
  // Helper: Capitalize first letter for display
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorTheme.themBasedBlack,
              fontWeight: FontWeight.normal,
            ),
            children: isRequired
                ? [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: colorTheme.themBasedBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
                : [],
          ),
        ),
        if (label != null) gapH4(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor ?? (colorTheme.cardBgColor),
            borderRadius: BorderRadius.circular(radius ?? 16),
            border: Border.all(
              color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.13),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButtonFormField<String>(
              value: _getValidValue(value, items),
              validator: validator,
              isExpanded: true,

              dropdownColor: colorTheme.buttonPrimaryColor, // dropdown list bg
              borderRadius: BorderRadius.circular(radius ?? 16),

              // The text style for the selected value
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.themBasedBlack, // black when selected
                fontWeight: FontWeight.bold,
              ),



              decoration: InputDecoration(
                prefixIcon: Icon(icon, color: colorTheme.black54, size: 22),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 14,
                ),
                // 👇 Works perfectly — applies to validation messages
                errorStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),

              hint: Text(
                hint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorTheme.black54,
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
                      color: colorTheme.themBasedWhite, // white inside dropdown list
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
                      color: colorTheme.themBasedBlack, // black only for selected value
                      fontWeight: FontWeight.normal,
                    ),
                  );
                }).toList();
              },
              onChanged: (val) {
                onChanged(val?.toLowerCase());
                // revalidate the form immediately
                Form.of(context).validate();
              },


              // onChanged: (val) => onChanged(val?.toLowerCase()),
              icon:  Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colorTheme.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
String? _getValidValue(String? value, List<String> items) {
  if (value == null || value.trim().isEmpty) return null;

  // Find the first item that matches value ignoring case & spaces
  final match = items.firstWhere(
        (e) => e.toLowerCase().trim() == value.toLowerCase().trim(),
    orElse: () => '',
  );

  return match.isEmpty ? null : match;
}
