import 'package:flutter/material.dart';

class ForgotPasswordBackground extends StatelessWidget {
  final Animation<double> floatAnimation;
  final Animation<double> glowAnimation;
  final Animation<double> rotateAnimation;

  const ForgotPasswordBackground({
    super.key,
    required this.floatAnimation,
    required this.glowAnimation,
    required this.rotateAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _FloatingOrbs(
          floatAnimation: floatAnimation,
          glowAnimation: glowAnimation,
        ),
        _RotatingShapes(rotateAnimation: rotateAnimation),
      ],
    );
  }
}

class _FloatingOrbs extends StatelessWidget {
  final Animation<double> floatAnimation;
  final Animation<double> glowAnimation;

  const _FloatingOrbs({
    Key? key,
    required this.floatAnimation,
    required this.glowAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: floatAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: 120 + floatAnimation.value,
              left: 50,
              child: _GlowingOrb(
                size: 80,
                color: const Color(0xFF667eea),
                opacity: 0.3,
                glowAnimation: glowAnimation,
              ),
            ),
            Positioned(
              top: 300 - floatAnimation.value * 0.5,
              right: 40,
              child: _GlowingOrb(
                size: 120,
                color: const Color(0xFF764ba2),
                opacity: 0.2,
                glowAnimation: glowAnimation,
              ),
            ),
            Positioned(
              bottom: 200 + floatAnimation.value * 0.8,
              left: 30,
              child: _GlowingOrb(
                size: 60,
                color: const Color(0xFF4facfe),
                opacity: 0.25,
                glowAnimation: glowAnimation,
              ),
            ),
            Positioned(
              bottom: 100 - floatAnimation.value,
              right: 80,
              child: _GlowingOrb(
                size: 100,
                color: const Color(0xFF00f2fe),
                opacity: 0.15,
                glowAnimation: glowAnimation,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GlowingOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;
  final Animation<double> glowAnimation;

  const _GlowingOrb({
    required this.size,
    required this.color,
    required this.opacity,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                color.withValues(alpha:(opacity * glowAnimation.value)),
                color.withValues(alpha:(0.1 * glowAnimation.value)),
                Colors.transparent,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RotatingShapes extends StatelessWidget {
  final Animation<double> rotateAnimation;

  const _RotatingShapes({
    required this.rotateAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotateAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: 200,
              right: 100,
              child: Transform.rotate(
                angle: rotateAnimation.value,
                child: _GeometricShape.square(),
              ),
            ),
            Positioned(
              bottom: 250,
              left: 100,
              child: Transform.rotate(
                angle: -rotateAnimation.value,
                child: _GeometricShape.circle(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GeometricShape extends StatelessWidget {
  final double size;
  final BoxDecoration decoration;

  const _GeometricShape._({
    Key? key,
    required this.size,
    required this.decoration,
  }) : super(key: key);

  factory _GeometricShape.square() {
    return _GeometricShape._(
      size: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  factory _GeometricShape.circle() {
    return _GeometricShape._(
      size: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.15), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: decoration,
    );
  }
}