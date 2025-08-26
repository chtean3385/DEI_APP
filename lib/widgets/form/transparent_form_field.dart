import 'package:flutter/material.dart';

class TransparentFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final VoidCallback? onTogglePassword;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;


  TransparentFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.isPassword = false,
    this.onTogglePassword,
    this.validator,
    this.textCapitalization = TextCapitalization
        .none, this.autofillHints, this.textInputAction,

  });

  @override
  State<TransparentFormField> createState() => _TransparentFormFieldState();
}

class _TransparentFormFieldState extends State<TransparentFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.13),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && !_isPasswordVisible,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: widget.textCapitalization,
        autofillHints: widget.autofillHints,
        textInputAction:widget.textInputAction,
        cursorColor: Colors.white,
        style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,fontWeight:  FontWeight.normal
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color:Colors.white60,
        ),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 10,
            // fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(widget.icon, color: Colors.white70, size: 22),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.white70,
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
    );
  }
}
