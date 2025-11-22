import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class EditProfileActionButtons extends ConsumerWidget {
  final bool isEmployee;
  final bool isFromCommonEdit;

  const EditProfileActionButtons({super.key, this.isEmployee = false,this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeState = ref.watch(editEmployeeProfileProvider);
    final employeeController = ref.read(editEmployeeProfileProvider.notifier);
    final bool isLoading = employeeState.pageState == PageState.loading;
    final colorTheme = context.colors;

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
                   Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: colorTheme.buttonPrimaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Cancel',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: colorTheme.buttonPrimaryColor,
                    ),
                  ),
                ],
              ),
              radius: 30,
              color: colorTheme.themBasedWhite,
              borderColor: colorTheme.buttonPrimaryColor,
            ),

            const SizedBox(width: 16),

            // Save Button
            CustomThemeButton(
              onTap: () {
                print("isEmployee -- $isEmployee");
                if (isEmployee) {
                  employeeController.updateEmployeeProfileDetails(context,isFromCommonEdit:isFromCommonEdit );
                } else {}
              },
              isLoading: isLoading,
              padding: isLoading
                  ? const EdgeInsets.symmetric(horizontal: 50, vertical: 12)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Icon(
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
              color: colorTheme.buttonPrimaryColor,
              borderColor: colorTheme.buttonPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
