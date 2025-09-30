import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/enums.dart';
import '../../../../../widgets/others/custom_theme_button.dart';

class OTPVerifyButton extends ConsumerWidget {
  final List<TextEditingController> otpControllers;
  final VoidCallback onVerify;

  const OTPVerifyButton({
    super.key,
    required this.otpControllers,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(registerProvider);
    final controller = ref.watch(registerProvider.notifier);
    bool isComplete = otpControllers.every((controller) => controller.text.isNotEmpty);
    String otp = otpControllers.map((controller) => controller.text).join();
    // return CustomThemeButton(
    //   color: isComplete ?  AppColors.primaryColor : AppColors.secondaryDarkColor ,
    //   borderColor:isComplete ?  AppColors.primaryColor : AppColors.secondaryDarkColor  ,
    //   height: 56,
    //   radius: 16,
    //   isExpanded: true,
    //
    //   // alignRight: true,
    //   isLoading:authState.pageState == PageState.loading ,
    //   onTap: isComplete ? controller.verifyEmailOtp : null,
    //   child: Text(
    //     'Verify Code',
    //     style: context.textTheme.titleMedium?.copyWith(color: context.theme.colorScheme.onPrimary,fontSize: 18),
    //   ),
    // );
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isComplete
              ? [const Color(0xFF667eea), const Color(0xFF764ba2)]
              : [Colors.grey.shade300, Colors.grey.shade400],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isComplete
            ? [
          BoxShadow(
            color: const Color(0xFF667eea).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: (isComplete && authState.pageState != PageState.loading)
              ? () => controller.verifyEmailOtp(otp)
              : null,

          child: Center(
            child: authState.pageState == PageState.loading
                ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : Text(
              'Verify Code',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.colorScheme.onPrimary,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}