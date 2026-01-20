import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/controllers/auth/employee_login_controller.dart';
import '../../../../../providers/providers.dart';
import '../../otp/components/otp_input_fields.dart';

import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';

import 'forgot_password_forms.dart';

class ResetPasswordOTPVerificationScreen extends StatefulWidget {
  final String mobileNumber;

  const ResetPasswordOTPVerificationScreen({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<ResetPasswordOTPVerificationScreen> createState() =>
      _ResetPasswordOTPVerificationScreenState();
}

class _ResetPasswordOTPVerificationScreenState
    extends State<ResetPasswordOTPVerificationScreen> {
  /// OTP
  final otpControllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());

  /// Password
  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  late final LoginController controller;

  bool _isLoading = false;

  bool get _isOtpComplete => otpControllers.every((c) => c.text.isNotEmpty);

  bool get _canSubmit =>
      _isOtpComplete && (_passwordFormKey.currentState?.validate() ?? false);
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = ProviderScope.containerOf(
        context,
      ).read(loginProvider.notifier);
    });
  }
  @override
  void dispose() {
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final n in focusNodes) {
      n.dispose();
    }
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_passwordFormKey.currentState!.validate()) return;
    if (!_isOtpComplete) return;

    final otp = otpControllers.map((c) => c.text).join();
    final newPassword = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    setState(() => _isLoading = true);
    await controller.resetPassword(mobile: widget.mobileNumber,otp: otp,newPswd:newPassword ,cnfPswd:confirmPassword );
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Reset Password"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Password Form
                    ForgotPasswordForm(
                      formKey: _passwordFormKey,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      passwordFocus: _passwordFocus,
                      confirmPasswordFocus: _confirmPasswordFocus,
                    ),

                    gapH32(),
                    _SuccessMessage(mobile: widget.mobileNumber),
                    gapH8(),

                    /// 🔹 OTP Fields
                    OTPInputFields(
                      otpControllers: otpControllers,
                      focusNodes: focusNodes,
                      onChanged: (index, value) {
                        if (value.isNotEmpty && index < 5) {
                          focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                        setState(() {});
                      },
                    ),

                    gapH32(),
                  ],
                ),
              ),
            ),

            /// 🔹 Submit Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomThemeButton(
                height: 56,
                radius: 16,
                isExpanded: true,
                isLoading: _isLoading,
                color: _canSubmit
                    ? context.colors.buttonPrimaryColor
                    : context.colors.grey,
                borderColor: _canSubmit
                    ? context.colors.buttonPrimaryColor
                    : context.colors.grey,
                onTap: _isLoading? null : (_canSubmit ? _submit : null),
                child: Text(
                  AppStrings.submit,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  final String mobile;

  const _SuccessMessage({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return Text(
      'We’ve sent a 6-digit verification code to your mobile number - $mobile ',
      textAlign: TextAlign.left,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colors.themBasedBlack,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
