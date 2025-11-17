import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/providers/controllers/auth/employee_login_controller.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import the component files
import '../../../../constants/app_navigator.dart';
import 'components/otp_animation_controller.dart';
import 'components/otp_floating_background.dart';
import 'components/otp_main_card.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String mobileNumber;
  final String userId;

  const OTPVerificationScreen({
    super.key,
    required this.mobileNumber,
    required this.userId,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen>
    with TickerProviderStateMixin {

  late OTPAnimationController _animationController;
  List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  int resendTimer = 120;

  @override
  void initState() {
    super.initState();
    _animationController = OTPAnimationController(this);
    _animationController.initializeAnimations();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProviderScope.containerOf(
        context,
      ).read(verifyOtpProvider.notifier).setMobileUserId(widget.mobileNumber,widget.userId);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && resendTimer > 0) {
        setState(() {
          resendTimer--;
        });
        _startTimer();
      }
    });
  }

  void _verifyOTP() {
    String otp = otpControllers.map((controller) => controller.text).join();
    ProviderScope.containerOf(
      context,
    ).read(verifyOtpProvider.notifier).verifyOtp(otp);
  }

  void _resendCode() {
    setState(() {
      resendTimer = 30;
      // Clear OTP inputs
      for (var controller in otpControllers) {
        controller.clear();
      }
    });
    _startTimer();
    showSnackBar("Verification code sent!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryDarkColor
            ],
          ),
        ),
        child: Stack(
          children: [
            // Floating background elements
            OTPFloatingBackground(
              floatingAnimation: _animationController.floatingAnimation,
            ),

            // Main content
            SafeArea(
              child: AnimatedBuilder(
                animation: _animationController.slideAnimation,
                builder: (context, child) {
                  double opacity = (1 - (_animationController.slideAnimation.value / 50))
                      .clamp(0.0, 1.0);

                  return Transform.translate(
                    offset: Offset(0, _animationController.slideAnimation.value),
                    child: Opacity(
                      opacity: opacity,
                      child: Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: OTPMainCard(
                            otpControllers: otpControllers,
                            focusNodes: focusNodes,
                            resendTimer: resendTimer,
                            pulseAnimation: _animationController.pulseAnimation,
                            shineAnimation: _animationController.shineAnimation,
                            onResendCode: _resendCode,
                            onOTPChanged: (index, value) {
                              if (value.isNotEmpty && index < 5) {
                                focusNodes[index + 1].requestFocus();
                              } else if (value.isEmpty && index > 0) {
                                focusNodes[index - 1].requestFocus();
                              }
                              // Trigger completion callback when all fields are filled
                              if (index == 5  &&
                                  otpControllers.every((c) => c.text.isNotEmpty)) {
                                // Unfocus all fields to hide keyboard
                                FocusScope.of(context).unfocus();
                                _verifyOTP();
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              left: 10,
              top: 40,
              child: BackButton(),
            ),
          ],
        ),
      ),
    );
  }
}