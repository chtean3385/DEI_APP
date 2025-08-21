import 'package:flutter/material.dart';

class OTPFloatingBackground extends StatelessWidget {
  final Animation<double> floatingAnimation;

  const OTPFloatingBackground({
    super.key,
    required this.floatingAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: floatingAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            _FloatingCircle(
              top: 100,
              left: 30,
              size: 60,
              opacity: 0.1,
              offset: Offset(0, floatingAnimation.value),
            ),
            _FloatingCircle(
              top: 150,
              right: 50,
              size: 80,
              opacity: 0.08,
              offset: Offset(0, -floatingAnimation.value),
            ),
            _FloatingCircle(
              bottom: 150,
              left: 60,
              size: 40,
              opacity: 0.12,
              offset: Offset(0, floatingAnimation.value * 0.5),
            ),
            _FloatingCircle(
              bottom: 100,
              right: 130,
              size: 90,
              opacity: 0.12,
              offset: Offset(0, floatingAnimation.value * 0.7),
            ),
            _FloatingCircle(
              bottom: 50,
              left: 90,
              size: 70,
              opacity: 0.12,
              offset: Offset(0, floatingAnimation.value * 0.8),
            ),
          ],
        );
      },
    );
  }
}

class _FloatingCircle extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final double opacity;
  final Offset offset;

  const _FloatingCircle({
    Key? key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.opacity,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform.translate(
        offset: offset,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: opacity),
          ),
        ),
      ),
    );
  }
}