import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class OTPHeader extends StatelessWidget {
  final String email;
  final Animation<double> pulseAnimation;
  final Animation<double> shineAnimation;

  const OTPHeader({
    super.key,
    required this.email,
    required this.pulseAnimation,
    required this.shineAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Animated icon container
        _AnimatedIcon(
          pulseAnimation: pulseAnimation,
          shineAnimation: shineAnimation,
        ),
        const SizedBox(height: 24),

        // Title
         Text(
          'Verify Email',
          style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        // Subtitle
        Text(
          'We\'ve sent a verification code to',
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 8),

        // Email container
        _EmailContainer(email: email),
      ],
    );
  }
}

class _AnimatedIcon extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final Animation<double> shineAnimation;

  const _AnimatedIcon({
    Key? key,
    required this.pulseAnimation,
    required this.shineAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                // Shine effect
                _ShineEffect(shineAnimation: shineAnimation),
                // Mail icon
                const Center(
                  child: Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ShineEffect extends StatelessWidget {
  final Animation<double> shineAnimation;

  const _ShineEffect({
    Key? key,
    required this.shineAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shineAnimation,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -shineAnimation.value),
                end: Alignment(1.0, shineAnimation.value),
                colors: [
                  Colors.transparent,
                  Colors.white.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmailContainer extends StatelessWidget {
  final String email;

  const _EmailContainer({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF667eea).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        email,
        style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryColor),
      ),
    );
  }
}