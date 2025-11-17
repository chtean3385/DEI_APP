import 'package:dei_champions/ui/pages/auth/signup/widgets/basic_info.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/other_info.dart';
import 'package:dei_champions/widgets/others/animated_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';

class EmployeeSignupScreen extends ConsumerWidget {
  const EmployeeSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(signupFlowControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSignupWrapper(
        child: SizedBox(
          height: double.infinity,
          child: PageView(
            controller: controller.pageController,
            physics:   const ClampingScrollPhysics(),
            allowImplicitScrolling: true,
            children: [
              BasicPersonalInfo(onNext: () => controller.nextStep()),
              OtherInfo(onNext: () => controller.nextStep()),
            ],
          ),
        ),
      ),
    );
  }
}

