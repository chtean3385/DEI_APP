import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.radius = 30,
    this.readOnly = false,
    this.makeBold = false,
    this.onChanged,
    this.autofillHints,
    this.textInputAction
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final double radius;
  final bool readOnly ;
  final bool makeBold ;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      cursorColor: Colors.black,
      maxLength: maxLength,
      style: theme.textTheme.bodyMedium?.copyWith(
      fontWeight: makeBold? FontWeight.w800 : FontWeight.normal
      ),
      autofillHints: autofillHints,
      textInputAction:textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefix: prefix,
        prefixStyle: theme.textTheme.bodyMedium,
        label: Text(
          label ?? '',
          style: theme.textTheme.bodyMedium
        ),
        hint: Text(
          hint ?? '',
          style: theme.textTheme.bodyMedium
        ),

        suffixIcon: suffix,
        fillColor: Colors.grey.shade300,
        contentPadding: const EdgeInsets.all(16),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
          // fontWeight: FontWeight.w600,
        ),
        counterStyle: TextStyle(
          color: Colors.black, // or any bright color
          fontSize: 12,
          fontWeight: FontWeight.w500,
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
    );
  }
}
