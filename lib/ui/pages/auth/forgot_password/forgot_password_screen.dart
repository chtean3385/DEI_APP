import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_validators.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/controllers/auth/employee_login_controller.dart';
import '../../../../providers/providers.dart';
import 'components/forgot_password_animation_controller.dart';
import 'components/forgot_password_back_button.dart';
import 'components/forgot_password_background_component.dart';
import 'components/forgot_password_form_component.dart';
import 'components/forgot_password_success_component.dart';

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
      _emailController.addListener(() {
        final text = _emailController.text.trim();
        final isValid = _isValid(AppValidators.email, text);
        controller.updateEmailValidity(isValid);
      });
    });
  }

  bool _isValid(FormFieldValidator<String> validator, String value) {
    return validator(value) == null;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _sendResetEmail() async {
    if (_formKey.currentState?.validate() == true) {
      controller.forgotPassword(_emailController.text);
    }
  }
  void _reSendResetEmail() async {
      controller.forgotPassword(_emailController.text);
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
                          child: Consumer(
                              builder: (context, ref, _) {
                                final _emailSent = ref.watch(loginProvider).isEmailSend == true;

                                return _emailSent ? ForgotPasswordSuccessCard(
                                  email: _emailController.text,
                                  pulseAnimation:
                                  _animationController.pulseAnimation,
                                  onResend: _reSendResetEmail,

                                ) : Form(
                                  key: _formKey,
                                  child: ForgotPasswordFormCard(
                                    emailController: _emailController,
                                    emailFocusNode: _emailFocusNode,
                                    pulseAnimation:
                                    _animationController.pulseAnimation,
                                    onSendReset: _sendResetEmail,
                                  ),
                                );
                              }
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
