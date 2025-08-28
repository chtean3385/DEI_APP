import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/providers.dart';

class RegistrationProgressBar extends ConsumerWidget {
  const RegistrationProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupFlowControllerProvider);

    final int currentStep = state.currentStep;
    final int totalSteps = state.totalSteps;
    final double progress = (currentStep + 1) / totalSteps;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Step ${currentStep + 1} of $totalSteps',
              style: context.textTheme.bodyMedium?.copyWith(  color: Colors.black,fontWeight: FontWeight.w600),
            ),
            Text(
              '${(progress * 100).round()}%',
              style: context.textTheme.bodyMedium?.copyWith(  color: Colors.black,fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16), // Rounded corners
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.primaryColor.withValues(alpha: 0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            minHeight: 10,
          ),
        ),
      ],
    );
  }
}
