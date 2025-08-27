import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/auth/signup/screens/employment_screen.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/basic_info.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/other_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';


class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(signupFlowControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SizedBox(
        height: double.infinity,
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          allowImplicitScrolling: true,
          children: [
            BasicPersonalInfo(
              onNext: () => controller.nextStep(),
            ),
            OtherInfo(
              onNext: () => controller.nextStep(),
            ),
            EmploymentScreen(onNext: () => controller.nextStep()),
          ],
        ),
      ),
    );
  }
}
