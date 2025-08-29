import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

import '../../constants/app_colors.dart';

class TransparentFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final IconData icon;
  final bool isPassword;
  final VoidCallback? onTogglePassword;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;


  TransparentFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,

    this.isPassword = false,
    this.onTogglePassword,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.keyboardType,
    this.label,

  });

  @override
  State<TransparentFormField> createState() => _TransparentFormFieldState();
}

class _TransparentFormFieldState extends State<TransparentFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    print("_TransparentFormFieldState build");
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       if(widget.label != null) Text(widget.label!,style:theme.textTheme.bodyMedium?.copyWith(
            color: Colors.black,fontWeight:  FontWeight.normal
        ) ),
        if(widget.label != null) gapH4(),
        DecoratedBox(
          decoration: BoxDecoration(
            color:AppColors.primaryColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.13),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword && !_isPasswordVisible,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: widget.textCapitalization,
              autofillHints: widget.autofillHints,
              textInputAction:widget.textInputAction,
              inputFormatters: widget.inputFormatters,
              cursorColor: Colors.black,
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,fontWeight:  FontWeight.normal
              ),
              onFieldSubmitted:widget.onFieldSubmitted,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color:Colors.black54,
              ),
                errorStyle: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.redAccent,fontWeight:  FontWeight.normal,fontSize: 10
                ),
                prefixIcon: Icon(widget.icon, color: Colors.black54, size: 22),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
