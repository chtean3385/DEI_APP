import 'package:dei_champions/ui/pages/auth/otp/components/resend_otp.dart';
import 'package:flutter/material.dart';
import 'otp_header.dart';
import 'otp_input_fields.dart';
import 'otp_verify_button.dart';

class OTPMainCard extends StatelessWidget {
  final List<TextEditingController> otpControllers;
  final List<FocusNode> focusNodes;
  final int resendTimer;
  final Animation<double> pulseAnimation;
  final Animation<double> shineAnimation;
  final VoidCallback onResendCode;
  final Function(int index, String value) onOTPChanged;

  const OTPMainCard({
    super.key,
    required this.otpControllers,
    required this.focusNodes,
    required this.resendTimer,
    required this.pulseAnimation,
    required this.shineAnimation,
    required this.onResendCode,
    required this.onOTPChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OTPHeader(
            pulseAnimation: pulseAnimation,
            shineAnimation: shineAnimation,
          ),
          const SizedBox(height: 32),
          OTPInputFields(
            otpControllers: otpControllers,
            focusNodes: focusNodes,
            onChanged: onOTPChanged,
          ),
          const SizedBox(height: 32),
          OTPVerifyButton(
            otpControllers: otpControllers,
          ),
          const SizedBox(height: 24),
          OTPResendSection(
            resendTimer: resendTimer,
            onResend: onResendCode,
          ),
        ],
      ),
    );
  }
}