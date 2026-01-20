import 'package:flutter/material.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';


class ForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;

  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordFocus,
    required this.confirmPasswordFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /// New Password
          TransparentFormField(
            controller: passwordController,
            focusNode: passwordFocus,
            hint: 'New Password',
            label: 'New Password',
            icon: Icons.lock_outline,
            textInputAction: TextInputAction.next,
            isPassword: true,
            validator: AppValidators.signupPassword,
            nextFocusNode: confirmPasswordFocus,
          ),

          gapH20(),

          /// Confirm Password
          TransparentFormField(
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocus,
            hint: 'Confirm Password',
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            textInputAction: TextInputAction.done,
            isPassword: true,
            validator:
            AppValidators.confirmPassword(passwordController),
          ),
        ],
      ),
    );
  }
}
