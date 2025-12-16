import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const ForgotPasswordEmailInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorTheme.themBasedBlack,
          fontWeight: FontWeight.normal,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: AppValidators.email,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'Enter your email',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: colorTheme.black54,
          ),
          labelStyle: theme.textTheme.bodyMedium?.copyWith(
            color: colorTheme.black54,
          ),
          errorStyle: theme.textTheme.displaySmall?.copyWith(
            color: Colors.redAccent,
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
          prefixIcon: _EmailIcon(),
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}


class _EmailIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.email,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}