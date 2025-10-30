import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class ApplyJobButton extends ConsumerWidget {
  final String jobId;
  const ApplyJobButton({super.key, required this.jobId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeJobDetailsProvider);
    final applyState = ref.watch(employeeManageJobProvider);
    final controller = ref.read(employeeManageJobProvider.notifier);
    final bool isApplied = state.data?.isApplied ?? false;
    final theme = Theme.of(context).textTheme;
    return CustomThemeButton(
      onTap: () =>isApplied ? controller.unApplyJob(context, jobId):  controller.applyJob(context, jobId),
      isExpanded: true,
      isLoading: applyState.pageState ==PageState.loading,
      radius: 30,
      color: isApplied ? Colors.grey: AppColors.primaryColor,
      borderColor: isApplied ? Colors.grey: AppColors.primaryColor,
      child: Text(
        isApplied ? "Applied"    : "Apply Now",
        style: theme.labelMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}