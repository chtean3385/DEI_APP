
import 'package:dei_champions/ui/pages/auth/signup_employer/widgets/employer_address_details.dart';
import 'package:dei_champions/ui/pages/auth/signup_employer/widgets/employer_basic_info.dart';
import 'package:dei_champions/ui/pages/auth/signup_employer/widgets/employer_company_details.dart';
import 'package:dei_champions/widgets/others/animated_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';
import '../signup/widgets/signup_back_button.dart';

class SignupEmployerScreen extends ConsumerWidget {
  const SignupEmployerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(employerSignupFlowControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: SignupBackButton(isEmployer: true),
      // ),
      body: AnimatedSignupWrapper(
        child: SizedBox(
          height: double.infinity,
          child: PageView(
            controller: controller.pageController,
            physics: const ClampingScrollPhysics(),
            allowImplicitScrolling: true,
            children: [
              EmployerBasicPersonalInfo(onNext: () => controller.nextStep()),
              EmployerCompanyDetails(onNext: () => controller.nextStep()),
              EmployerAddressDetails(onNext: () => controller.nextStep()),

            ],
          ),
        ),
      ),
    );
  }
}

