import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class DropDownOutlined extends StatelessWidget {
  final List<String> itemValues;
  final String? suffixText;
  final String selectedItem;
  final String? label;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  final bool isRequiredField;
  final Color? color;
  final bool isValidateAlways;
  final bool isWithoutBorder;
  final double? height;
  final double radius;

  const DropDownOutlined({
    super.key,
    required this.itemValues,
    this.suffixText,
    required this.selectedItem,
    this.label,
    this.validator,
    required this.onChanged,
    this.color,
    this.isRequiredField = true,
    this.isValidateAlways = false,
    this.isWithoutBorder = false,
    this.height,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        size: 20,
        color: Colors.black,
      ),
      dropdownColor: Colors.white,
      isExpanded: true,
      elevation: 1,
      validator: isRequiredField ? validator : null,
      autovalidateMode: isValidateAlways
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: context.theme.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.secondary,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
          // fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(radius),
            right: Radius.circular(radius),
          ),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w800,
      ),

      items: itemValues.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            textScaleFactor: 1,
            suffixText?.isNotEmpty == true ? "$value $suffixText" : value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
