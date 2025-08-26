import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import 'back_to_login.dart';

class ForgotPasswordSuccessCard extends StatelessWidget {
  final String email;
  final Animation<double> pulseAnimation;

  const ForgotPasswordSuccessCard({
    super.key,
    required this.email,
    required this.pulseAnimation,
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
          _SuccessIcon(pulseAnimation: pulseAnimation),
          const SizedBox(height: 32),
          _SuccessTitle(),
          const SizedBox(height: 16),
          _SuccessMessage(),
          const SizedBox(height: 8),
          _EmailDisplay(email: email),
          const SizedBox(height: 32),
          BackToLogin(),
        ],
      ),
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const _SuccessIcon({
    required this.pulseAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF45a049)],
              ),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}

class _SuccessTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Text(
      'Check Your Email',
      style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600)

    );
  }
}

class _SuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'We\'ve sent a password reset link to',
      style: context.textTheme.bodySmall?.copyWith(color: Colors.black54)

    );
  }
}

class _EmailDisplay extends StatelessWidget {
  final String email;

  const _EmailDisplay({
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        email,
        style: context.textTheme.titleMedium?.copyWith(color: Color(0xFF4CAF50),fontWeight: FontWeight.w600)
      ),
    );
  }
}