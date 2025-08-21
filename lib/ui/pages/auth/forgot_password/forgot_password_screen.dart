import 'package:flutter/material.dart';

import '../../../../widgets/others/snack_bar.dart';
import 'components/forgot_password_animation_controller.dart';
import 'components/forgot_password_back_button.dart';
import 'components/forgot_password_background_component.dart';
import 'components/forgot_password_form_component.dart';
import 'components/forgot_password_success_component.dart';
import 'components/forgot_password_validation_result.dart';

// Import component files

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  late ForgotPasswordAnimationController _animationController;
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void initState() {
    super.initState();
    _animationController = ForgotPasswordAnimationController(this);
    _animationController.initializeAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _sendResetEmail() async {
    final validationResult = ForgotPasswordValidator.validateEmail(
      _emailController.text,
    );

    if (!validationResult.isValid) {
      showSnackBar(validationResult.errorMessage!);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _emailSent = true;
    });

    showSnackBar('Reset link sent to your email!');
  }



  void _goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: Stack(
          children: [
            // Animated Background
            ForgotPasswordBackground(
              floatAnimation: _animationController.floatAnimation,
              glowAnimation: _animationController.glowAnimation,
              rotateAnimation: _animationController.rotateAnimation,
            ),

            // Main Content
            SafeArea(
              child: AnimatedBuilder(
                animation: _animationController.slideAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      _animationController.slideAnimation.value,
                    ),
                    child: Opacity(
                      opacity:
                          (1 -
                                  (_animationController.slideAnimation.value /
                                      100))
                              .clamp(0.0, 1.0),
                      child: Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: _emailSent
                              ? ForgotPasswordSuccessCard(
                                  email: _emailController.text,
                                  pulseAnimation:
                                      _animationController.pulseAnimation,
                                  onBackToLogin: _goBack,
                                )
                              : ForgotPasswordFormCard(
                                  emailController: _emailController,
                                  emailFocusNode: _emailFocusNode,
                                  isLoading: _isLoading,
                                  pulseAnimation:
                                      _animationController.pulseAnimation,
                                  onSendReset: _sendResetEmail,
                                  onBackToLogin: _goBack,
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Back Button
            ForgotPasswordBackButton(onPressed: _goBack),
          ],
        ),
      ),
    );
  }
}
