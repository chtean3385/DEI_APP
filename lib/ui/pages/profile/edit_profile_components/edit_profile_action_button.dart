import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class EditProfileActionButtons extends ConsumerWidget {
  final bool isEmployee;

  const EditProfileActionButtons({super.key, this.isEmployee = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeState = ref.watch(editEmployeeProfileProvider);
    final employeeController = ref.read(editEmployeeProfileProvider.notifier);
    final employerController = ref.read(editEmployerProfileProvider.notifier);
    final employerState = ref.watch(editEmployerProfileProvider);
    final bool isLoading = isEmployee
        ? employeeState.pageState == PageState.loading
        : employerState.pageState == PageState.loading;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Cancel Button
            CustomThemeButton(
              onTap: () {
                Navigator.pop(context);
              },
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Cancel',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              radius: 30,
              color: Colors.white,
              borderColor: AppColors.primaryColor,
            ),

            const SizedBox(width: 16),

            // Save Button
            CustomThemeButton(
              onTap: () {
                if (isEmployee) {
                  employeeController.updateEmployeeProfileDetails(context);
                } else {}
              },
              isLoading: isLoading,
              padding: isLoading
                  ? const EdgeInsets.symmetric(horizontal: 50, vertical: 12)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outline_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Save',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              radius: 30,
              color: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
