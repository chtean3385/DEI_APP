import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class ForgotPasswordHeader extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const ForgotPasswordHeader({super.key, required this.pulseAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AnimatedIcon(pulseAnimation: pulseAnimation),
        const SizedBox(height: 24),
        _Title(),
        const SizedBox(height: 12),
        _Description(),
      ],
    );
  }
}

class _AnimatedIcon extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const _AnimatedIcon({required this.pulseAnimation});

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF667eea),
                  Color(0xFF764ba2),
                  Color(0xFF4facfe),
                ],
              ),
            ),
            child: const Icon(Icons.lock_reset, color: Colors.white, size: 50),
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Forgot Password?',
      style: context.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Don\'t worry! It happens. Please enter the email address associated with your account.',
      textAlign: TextAlign.center,
      style: context.textTheme.bodySmall?.copyWith(color: Colors.black54),
    );
  }
}
