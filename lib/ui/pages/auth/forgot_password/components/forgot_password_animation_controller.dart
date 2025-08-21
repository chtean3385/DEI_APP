import 'package:flutter/material.dart';

class ForgotPasswordAnimationController {
  final TickerProvider tickerProvider;

  late AnimationController _slideController;
  late AnimationController _pulseController;
  late AnimationController _glowController;
  late AnimationController _floatController;
  late AnimationController _rotateController;

  late Animation<double> _slideAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _floatAnimation;
  late Animation<double> _rotateAnimation;

  // Getters
  Animation<double> get slideAnimation => _slideAnimation;
  Animation<double> get pulseAnimation => _pulseAnimation;
  Animation<double> get glowAnimation => _glowAnimation;
  Animation<double> get floatAnimation => _floatAnimation;
  Animation<double> get rotateAnimation => _rotateAnimation;

  ForgotPasswordAnimationController(this.tickerProvider);

  void initializeAnimations() {
    // Initialize controllers
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: tickerProvider,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: tickerProvider,
    );

    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    );

    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: tickerProvider,
    );

    _rotateController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: tickerProvider,
    );

    // Initialize animations
    _slideAnimation = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));

    _floatAnimation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159,
    ).animate(CurvedAnimation(
      parent: _rotateController,
      curve: Curves.linear,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() {
    _slideController.forward();
    _pulseController.repeat(reverse: true);
    _glowController.repeat(reverse: true);
    _floatController.repeat(reverse: true);
    _rotateController.repeat();
  }

  void dispose() {
    _slideController.dispose();
    _pulseController.dispose();
    _glowController.dispose();
    _floatController.dispose();
    _rotateController.dispose();
  }
}