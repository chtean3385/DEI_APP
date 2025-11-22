import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class TransparentDatePickerField extends StatefulWidget {
  final String hint;
  final String? label;
  final IconData icon;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final double? radius;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool isRequired ;
  final bool enabled ;

  const TransparentDatePickerField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.label,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.radius,
    this.fillColor,
    this.validator,
    this.isRequired = false,
    this.enabled = true,
  });

  @override
  State<TransparentDatePickerField> createState() => _TransparentDatePickerFieldState();
}

class _TransparentDatePickerFieldState extends State<TransparentDatePickerField> {
  Future<void> _pickDate() async {
    FocusScope.of(context).unfocus();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime(now.year - 18),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
              primary: AppColors.primaryForDarkThemeColor,
              onPrimary: Colors.black, // text on primary (header text)
              onSurface: Colors.white, // calendar numbers
            )
                : ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        widget.controller.text =
        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.themBasedBlack,
                fontWeight: FontWeight.normal,
              ),
              children: widget.isRequired
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
        if (widget.label != null) gapH4(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: widget.enabled ?  (widget.fillColor ?? colorTheme.buttonPrimaryColor.withValues(alpha: 0.15)): colorTheme.grey,
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
            border: Border.all(
              color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.13),
            ),
          ),
          child: InkWell(
            onTap: widget.enabled? _pickDate :null,
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
            child: IgnorePointer(
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                readOnly: true,
                style: theme.textTheme.bodyMedium?.copyWith(color: colorTheme.themBasedBlack),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: colorTheme.black54,
                  ),
                  prefixIcon: Icon(widget.icon, color: colorTheme.black54, size: 22),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
