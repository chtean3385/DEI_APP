import 'package:dei_champions/ui/pages/auth/forgot_password/components/send_reset_link.dart';
import 'package:flutter/material.dart';
import 'back_to_login.dart';
import 'forgot_password_email_field.dart';
import 'forgot_password_header.dart';

class ForgotPasswordFormCard extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final Animation<double> pulseAnimation;
  final VoidCallback onSendReset;

  const ForgotPasswordFormCard({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.pulseAnimation,
    required this.onSendReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ForgotPasswordHeader(pulseAnimation: pulseAnimation),
          const SizedBox(height: 40),
          ForgotPasswordEmailInput(
            controller: emailController,
            focusNode: emailFocusNode,
          ),
          const SizedBox(height: 32),
          SendResetLink(
            onSendReset: onSendReset,
          ),
          const SizedBox(height: 24),
          BackToLogin(),
        ],
      ),
    );
  }

}