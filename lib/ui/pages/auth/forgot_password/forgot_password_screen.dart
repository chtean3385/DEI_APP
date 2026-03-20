import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_validators.dart';
import '../../../../providers/controllers/auth/employee_login_controller.dart';
import '../../../../providers/providers.dart';
import 'components/forgot_password_animation_controller.dart';
import 'components/forgot_password_back_button.dart';
import 'components/forgot_password_background_component.dart';
import 'components/forgot_password_form_component.dart';

// Import component files

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  late ForgotPasswordAnimationController _animationController;
  final TextEditingController mobileController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  late final LoginController controller;
  @override
  void initState() {
    super.initState();

    _animationController = ForgotPasswordAnimationController(this);
    _animationController.initializeAnimations();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = ProviderScope.containerOf(
        context,
      ).read(loginProvider.notifier);
      // Listen to email changes
      mobileController.addListener(() {
        final text = mobileController.text.trim();
        final isValid = _isValid(AppValidators.phone, text);
        controller.updatePhonValidity(isValid);
      });
    });
  }

  bool _isValid(FormFieldValidator<String> validator, String value) {
    return validator(value) == null;
  }

  @override
  void dispose() {
    _animationController.dispose();
    mobileController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _sendResetOtp() async {
    if (_formKey.currentState?.validate() == true) {
      controller.forgotPassword(mobileController.text);
    }
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
                          child: Form(
                            key: _formKey,
                            child: ForgotPasswordFormCard(
                              emailController: mobileController,
                              emailFocusNode: _emailFocusNode,
                              pulseAnimation:
                              _animationController.pulseAnimation,
                              onSendReset: _sendResetOtp,
                            ),
                          )
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
