import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../widgets/others/custom_theme_button.dart';

class AddUpdatePostButton extends ConsumerWidget {
  final bool isEdit;

  const AddUpdatePostButton({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: CustomThemeButton(
        child: Text(
          isEdit ? "Update" : "Post Job",
          style: theme.labelMedium?.copyWith(color: Colors.white),
        ),
        radius: 30,

        onTap: () {
          isEdit
              ? Navigator.pop(context)
              : AppNavigator.toBottomBar(initialPage: 2);
        },
        isExpanded: false,
        color: AppColors.primaryColor,
      ),
    );
  }
}
