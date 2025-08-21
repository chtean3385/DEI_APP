import 'package:flutter/material.dart';

class OTPResendSection extends StatelessWidget {
  final int resendTimer;
  final VoidCallback onResend;

  const OTPResendSection({
    Key? key,
    required this.resendTimer,
    required this.onResend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Didn\'t receive the code?',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),

        resendTimer > 0
            ? _ResendTimer(resendTimer: resendTimer)
            : _ResendButton(onResend: onResend),
      ],
    );
  }
}

class _ResendTimer extends StatelessWidget {
  final int resendTimer;

  const _ResendTimer({
    Key? key,
    required this.resendTimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend in ${resendTimer}s',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[500],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  final VoidCallback onResend;

  const _ResendButton({
    Key? key,
    required this.onResend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onResend,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF667eea)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Resend Code',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF667eea),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}