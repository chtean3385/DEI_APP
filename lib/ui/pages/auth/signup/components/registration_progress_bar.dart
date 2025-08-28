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
    final fullWidth = MediaQuery.of(context).size.width;
    final double height = 12;

    final int currentStep = state.currentStep;
    final int totalSteps = state.totalSteps;
    final double progress = (currentStep + 1) / totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Step ${currentStep + 1} of $totalSteps',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(progress * 100).round()}%',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // ✅ Fixed gradient animated progress bar
        Container(
          height: height,
          width: fullWidth,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(60),
            // border: Border.all(width: 1, color: AppColors.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800), // Smoother transition
                curve: Curves.easeInOutCubic, // Better curve for smooth animation
                width: fullWidth * progress.clamp(0.0, 1.0), // Ensure progress stays within bounds
                height: height, // ✅ Added explicit height to match container
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primarySemiDarkColor,
                      AppColors.primaryDarkColor,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight, // Changed to horizontal gradient
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withAlpha(
                          (0.3 * 255).round()),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
