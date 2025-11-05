import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

import '../../constants/app_colors.dart';

class TransparentFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final IconData? icon;
  final bool isPassword;
  final VoidCallback? onTogglePassword;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;

  // final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLength;
  final double? radius;
  final bool readOnly;

  final bool isRequired;

  final bool showCounter;

  final Color? fillColor;
  final ValueChanged<String>? onFieldSubmitted;

  TransparentFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,

    this.isPassword = false,
    this.onTogglePassword,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.textInputAction,
    // this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.keyboardType,
    this.label,
    this.minLines,
    this.maxLength,
    this.nextFocusNode,
    this.radius,
    this.readOnly = false,
    this.isRequired = false,
    this.showCounter = false,
    this.fillColor,
    this.onFieldSubmitted,
  });

  @override
  State<TransparentFormField> createState() => _TransparentFormFieldState();
}

class _TransparentFormFieldState extends State<TransparentFormField> {
  bool _isPasswordVisible = false;

  void _onTextChanged() => setState(() {
    print("_onTextChanged");
  });

  @override
  void initState() {
    super.initState();
    print("widget.showCounter - ${widget.showCounter}");
    if (widget.showCounter == true) widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.showCounter == true) widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              children: widget.isRequired
                  ? [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.black,
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
            color:
                widget.fillColor ??
                AppColors.primaryColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
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
              textInputAction: widget.textInputAction,
              inputFormatters: widget.inputFormatters,
              cursorColor: Colors.black,
              maxLength: widget.maxLength,
              maxLines: widget.isPassword ? 1 : null,
              minLines: widget.isPassword ? 1 : widget.minLines,
              readOnly: widget.readOnly,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              onFieldSubmitted:
                  widget.onFieldSubmitted ??
                  (_) {
                    if (widget.nextFocusNode != null) {
                      // Safe check: only move if nextNode is attached
                      if (widget.nextFocusNode!.hasFocus == false &&
                          widget.nextFocusNode!.context != null) {
                        FocusScope.of(
                          context,
                        ).requestFocus(widget.nextFocusNode);
                      } else {
                        FocusScope.of(context).unfocus();
                      }
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  },

              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                ),
                counterText:
                (widget.showCounter)
                    ? "${widget.controller.text.length} / ${widget.maxLength}"
                    : null,
                // 👈 live counter
                counterStyle: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                errorStyle: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
                prefixIcon: widget.icon != null
                    ? Icon(widget.icon, color: Colors.black54, size: 22)
                    : null,
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
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
