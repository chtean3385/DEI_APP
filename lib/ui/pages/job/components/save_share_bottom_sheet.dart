import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/job/components/save_hide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../providers/providers.dart';
import '../../auth/guest/guest_promot_login_alert.dart';
import '../../search/components/job_share_util.dart';

void showJobOptionsSheet(BuildContext context) {
  final colorTheme = context.colors;
  showModalBottomSheet(
    context: context,
    backgroundColor: colorTheme.alertBgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          final isGuest = ref.read(guestProvider);
          final job = ref.watch(employeeJobDetailsProvider).data; // 👈 read directly
          final jobNotifier = ref.read(employeeManageJobProvider.notifier);


          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDynamicButton(
                    activeIcon: FontAwesomeIcons.shareNodes,
                    inActiveIcon: FontAwesomeIcons.shareNodes,
                    activeTitle: "Share",
                    inActiveTitle: "Share",
                    radius: 30,
                    smaller: true,
                    activeIconSize: 12,
                    inActiveIconSize: 12,
                    activeColor: colorTheme.buttonPrimaryColor,
                    inActiveColor: colorTheme.buttonPrimaryColor,
                    activeBgColor: colorTheme.jobCardBgColor,
                    inActiveBgColor: colorTheme.jobCardBgColor,
                    initialValue: false,
                    // no toggle state needed
                    onPressed: (_) async {
                      if (isGuest) {
                        await showGuestButtonRestriction(context);
                        return false ;
                      }
                      final jobId = job?.id ?? "";
                      final jobTitle = job?.title ?? "Job Opportunity";

                      await JobShareUtil.shareJob(
                        context: context,
                        jobId: jobId,
                        jobTitle: jobTitle,
                      );
                      Navigator.pop(context);
                      return false;
                    },
                  ),


                  gapH16(),
                  /// 🔹 Save / Unsave Button
                  CustomDynamicButton(
                    activeIcon: FontAwesomeIcons.bookmark,
                    inActiveIcon: FontAwesomeIcons.solidBookmark,
                    activeTitle: "Save",
                    inActiveTitle: "Saved",
                    radius: 30,
                    smaller: true,
                    activeIconSize:12,
                    inActiveIconSize:12,
                    activeColor:colorTheme.buttonPrimaryColor,
                    inActiveColor: colorTheme.buttonPrimaryColor,
                    activeBgColor: colorTheme.jobCardBgColor,
                    inActiveBgColor: colorTheme.jobCardBgColor,
                    initialValue: !(job?.isSaved ?? false),
                    onPressed: (isSavedNow) async {
                      if (isGuest) {
                        await showGuestButtonRestriction(context);
                        return false ;
                      }

                      final jobId = job?.id ?? "";

                      if (isSavedNow) {
                        await jobNotifier.unSaveJob(jobId);
                        debugPrint("❌ unSaveJob for $jobId");
                        Navigator.pop(context);
                        return true;
                      } else {
                        await jobNotifier.saveJob(jobId);
                        debugPrint("✅ saveJob for $jobId");
                        Navigator.pop(context);
                        return true;
                      }

                    },
                  ),

                  gapH16(),

                  /// 🔹 Apply / Unapply Button
                  CustomDynamicButton(
                    activeIcon: FontAwesomeIcons.paperPlane,
                    inActiveIcon: FontAwesomeIcons.circleCheck,
                    activeTitle: "Apply",
                    inActiveTitle: "Applied",
                    size:15,
                    activeIconSize:12,
                    radius: 30,
                    smaller: true,
                    activeColor:colorTheme.buttonPrimaryColor,
                    inActiveColor: colorTheme.buttonPrimaryColor,
                    activeBgColor: colorTheme.jobCardBgColor,
                    inActiveBgColor: colorTheme.jobCardBgColor,
                    initialValue: !(job?.isApplied ?? false),
                    onPressed: (isAppliedNow) async {

                      if (isGuest) {
                        await showGuestButtonRestriction(context);
                        return false ;
                      }
                      final jobId = job?.id ?? "";

                      if (isAppliedNow) {
                        final success =
                        await jobNotifier.unApplyJob(context, jobId);
                        Navigator.pop(context);
                        return success;
                      } else {
                        final success =
                        await jobNotifier.applyJob(context, jobId);
                        Navigator.pop(context);
                        return success;
                      }
                    },
                  ),

                  gapH16(),

                ],
              ),
            ),
          );
        },
      );
    },
  );
}

