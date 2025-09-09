import 'package:dei_champions/ui/pages/auth/otp/components/resend_otp.dart';
import 'package:flutter/material.dart';
import 'otp_header.dart';
import 'otp_input_fields.dart';
import 'otp_verify_button.dart';

class OTPMainCard extends StatelessWidget {
  final String email;
  final bool isEmail;
  final List<TextEditingController> otpControllers;
  final List<FocusNode> focusNodes;
  final int resendTimer;
  final Animation<double> pulseAnimation;
  final Animation<double> shineAnimation;
  final VoidCallback onVerifyOTP;
  final VoidCallback onResendCode;
  final Function(int index, String value) onOTPChanged;

  const OTPMainCard({
    super.key,
    required this.email,
    required this.otpControllers,
    required this.focusNodes,
    required this.resendTimer,
    required this.pulseAnimation,
    required this.shineAnimation,
    required this.onVerifyOTP,
    required this.onResendCode,
    required this.onOTPChanged,
     this.isEmail = true,
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
            email: email,
            isEmail: isEmail,
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
            onVerify: onVerifyOTP,
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