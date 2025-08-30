import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class AnimatedSignupWrapper extends StatefulWidget {
  final Widget child;
  final bool isEmployer;

  const AnimatedSignupWrapper({
    super.key,
    required this.child,
    this.isEmployer = false,
  });

  @override
  State<AnimatedSignupWrapper> createState() => _AnimatedSignupWrapperState();
}

class _AnimatedSignupWrapperState extends State<AnimatedSignupWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.9),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
    // Run after widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final container = ProviderScope.containerOf(context);
      if (widget.isEmployer) {
        container.read(employerSignupFlowControllerProvider.notifier).iniController();
      } else {
        container.read(signupFlowControllerProvider.notifier).iniController();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
