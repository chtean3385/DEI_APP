import 'package:flutter/material.dart';

class OTPAnimationController {
  final TickerProvider tickerProvider;

  late AnimationController _slideController;
  late AnimationController _pulseController;
  late AnimationController _shineController;
  late AnimationController _floatingController;

  late Animation<double> _slideAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _shineAnimation;
  late Animation<double> _floatingAnimation;

  // Getters for animations
  Animation<double> get slideAnimation => _slideAnimation;
  Animation<double> get pulseAnimation => _pulseAnimation;
  Animation<double> get shineAnimation => _shineAnimation;
  Animation<double> get floatingAnimation => _floatingAnimation;

  OTPAnimationController(this.tickerProvider);

  void initializeAnimations() {
    // Initialize animation controllers
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: tickerProvider,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    );

    _shineController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: tickerProvider,
    );

    _floatingController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: tickerProvider,
    );

    // Initialize animations
    _slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _shineAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shineController,
      curve: Curves.linear,
    ));

    _floatingAnimation = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _slideController.forward();
    _pulseController.repeat(reverse: true);
    _shineController.repeat();
    _floatingController.repeat(reverse: true);
  }

  void dispose() {
    _slideController.dispose();
    _pulseController.dispose();
    _shineController.dispose();
    _floatingController.dispose();
  }
}