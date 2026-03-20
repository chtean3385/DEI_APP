import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/others/custom_theme_button.dart';
import '../../auth/guest/guest_promot_login_alert.dart';

class ApplyJobButton extends ConsumerWidget {
  final String jobId;
  const ApplyJobButton({super.key, required this.jobId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGuest = ref.read(guestProvider);
    final state = ref.watch(employeeJobDetailsProvider);
    final applyState = ref.watch(employeeManageJobProvider);
    final controller = ref.read(employeeManageJobProvider.notifier);
    final bool isApplied = state.data?.isApplied ?? false;
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;

    return CustomThemeButton(
      onTap: () async {
        if (isGuest) {
          await showGuestButtonRestriction(context);
          return ;
        }

        isApplied ? controller.unApplyJob(context, jobId):  controller.applyJob(context, jobId);},
      isExpanded: true,
      isLoading: applyState.pageState ==PageState.loading && applyState.loadingJobIds.contains(jobId),
      radius: 50,
      color: isApplied ? colorTheme.grey: colorTheme.buttonPrimaryColor,
      borderColor: isApplied ? colorTheme.grey: colorTheme.buttonPrimaryColor,
      child: Text(
        isApplied ? "Applied"    : "Apply Now",
        style: theme.labelMedium?.copyWith(color: colorTheme.themBasedWhite),
      ),
    );
  }
}