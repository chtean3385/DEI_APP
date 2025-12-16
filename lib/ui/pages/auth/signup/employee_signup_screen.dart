import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/basic_info.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/other_info.dart';
import 'package:dei_champions/widgets/others/animated_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/widget_utils.dart';

class EmployeeSignupScreen extends ConsumerWidget {
  const EmployeeSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(signupFlowControllerProvider.notifier);

    return   PopScope(
      canPop: false, // We fully control back navigation
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return; // Flutter already handled pop → do nothing

        final currentPage = controller.pageController.page?.round() ?? 0;

        if (currentPage > 0) {
          // Go to previous page
          controller.previousStep();
        } else {
          // At first page → show exit popup
          final exit = await WidgetUtils.showExitPopUp(context,sBtnLbl: "Yes",message: "Are you sure to cancel the registration?");

          if (exit == true && context.mounted) {
            Navigator.of(context).pop(); // exit the signup flow
          }
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.commonDividerBgColor,
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
      ),
    );
  }
}

