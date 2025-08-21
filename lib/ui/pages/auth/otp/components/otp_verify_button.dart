import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class OTPVerifyButton extends StatelessWidget {
  final List<TextEditingController> otpControllers;
  final VoidCallback onVerify;

  const OTPVerifyButton({
    super.key,
    required this.otpControllers,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    bool isComplete = otpControllers.every((controller) => controller.text.isNotEmpty);

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
          onTap: isComplete ? onVerify : null,
          child:  Center(
            child: Text(
              'Verify Code',
              style: context.textTheme.titleMedium?.copyWith(color: context.theme.colorScheme.onPrimary,fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}